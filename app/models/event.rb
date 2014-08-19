class Event < ActiveRecord::Base
  after_save do
    seed_cache_and_website    
  end
  
  after_destroy do
    seed_cache_and_website
  end
  
  after_update do
    seed_cache_and_website
  end
  
  has_and_belongs_to_many :categories
  has_many :point_of_interests, :dependent => :destroy
  belongs_to :icon
  
  validates :name, :description, :latitude, :longitude, :event_date, :aoi_size, :event_label, :icon, :presence => true
  
  validates :glide_number, :format => {
      :with => /([a-zA-Z]{2}-[0-9]{4}-[0-9]{6}-[a-zA-Z]{3}|^\d*$)/,
      :message => "must be of the following format: AA-2000-000000-AAA"
    }
    
  validates :name, :description, :length => { :maximum => 250 }
  
  validate :at_least_one_environment_is_selected
    
  LABEL_OPTIONS = [ "Yellow", "Orange", "Red" ]
  BBOX_SIZES = [5,10,13,16,25,50]
  DEFAULT_AOI_SIZE = 16
  
  scope :last_365, where("event_date >= ?", 1.years.ago).order("event_date DESC")
  
  scope :last_2, where("event_date >= ?", 1.years.ago).limit(20).order("event_date DESC")
  
  def aoi_size
    self[:aoi_size] ||= DEFAULT_AOI_SIZE
  end
  
  def external_image_url
    return DEFAULT_IMAGE_URL if self.icon.nil?
      
    File.join(BASE_IMAGE_URL, self.icon.thumbnail_file_name.gsub(/\.jpg|\.jpeg|\.gif/,".png"))
  end
  
  def as_json(options = {})
      {
          eventId: self.id,
          name: self.name.nil? ? "":self.name,
          description: self.description.nil? ? "":self.description, 
          latitude: self.latitude.nil? ? 0:self.latitude,
          longitude: self.longitude.nil? ? 0:self.longitude,
          imageUrl: self.external_image_url,
          aoiSize: self.aoi_size,
          eventDate: self.event_date,
          active: self.is_active?,
          available_in_commercial: self.available_in_commercial,
          available_in_r3: self.available_in_r3,
          newsUrl: self.news_link.nil? ? "":self.news_link,
          firstwatchUrl: self.firstwatch_link.nil? ? "":self.firstwatch_link,
          glideNumber: self.glide_number.nil? ? "":self.glide_number,
          eventLabel: self.event_label.nil? ? "":self.event_label,
          categories: self.categories.map{|cat| cat.name}.join(","),
          points_of_interest: self.point_of_interests,
          features: self.get_wfs_features,
          has_after_imagery: self.has_after_imagery,
          has_new_imagery: self.has_new_imagery,
          newest_imagery_age: self.newest_imagery_age
      }
  end
  
  def self.to_rss_for_js(events,options = {})
      options[:indent] ||= 0
      xml = options[:builder] ||= ::Builder::XmlMarkup.new(:indent => options[:indent])
      xml.instruct! :xml, :version => "1.0" unless options[:skip_instruct]
      xml.rss :version => "2.0", "xmlns:georss" => "http://www.georss.org/georss" do
        xml.channel do
          xml.title "DigitalGlobe FirstLook Messaging Service"
          xml.description "GeoRSS event-based messaging service"
          xml.copyright "DigitalGlobe 2012"
          xml.author "DigitalGlobe Inc."
          xml.ttl "60"

          events.each do |event| 
              xml.item do
                xml.eventId(event.id)
                xml.title(event.name.gsub(/\'/,'').strip)
                xml.description(event.description.gsub(/\'/,'').gsub(/\r\n*/,'').strip)
                xml.pubDate(event.created_at.rfc2822)
                xml.image(event.external_image_url)
                xml.tag!("georss:point","#{event.latitude} #{event.longitude}")
                xml.aoi_size(event.aoi_size)
                xml.tag!("georss:bbox","#{event.get_bbox_params}") 
                xml.active(event.is_active?)
                xml.categories(event.categories.map{|cat| cat.name}.join(","))
                xml.eventDate(event.event_date)
                xml.news_url(event.news_link)
                xml.firstwatch_url(event.firstwatch_link)
                xml.points_of_interest do
                  event.point_of_interests.each do |poi|
                    xml.point_of_interest do
                      xml.title(poi.name.gsub(/\'/,'').strip)
                      xml.has_recent_imagery(poi.has_recent_imagery)
                      xml.description(poi.description.gsub(/\'/,'').gsub(/\r\n*/,'').strip)
                      xml.tag!("georss:point","#{poi.latitude} #{poi.longitude}")
                    end
                  end
                end
              end
          end
        end
      end
  end  
  
  def get_bbox_params
    # calculate approximate bbox
    p = GeoKit::LatLng.normalize(self.latitude, self.longitude)
    r = (Math.sqrt(self.aoi_size/2))/2
    bounds = GeoKit::Bounds.from_point_and_radius(p,r)
    swNe = bounds.sw.to_s + " " + bounds.ne.to_s
    return swNe
  end
  
  def get_bbox_params2
    # calculate approximate bbox (same as bbox params but with a comma instead of a space)
    p = GeoKit::LatLng.normalize(self.latitude, self.longitude)
    r = (Math.sqrt(self.aoi_size/2))/2 * 3
    bounds = GeoKit::Bounds.from_point_and_radius(p,r)
    swNe = bounds.sw.to_s + "," + bounds.ne.to_s
    return swNe
  end
  
  
  
  def get_wfs_features
  	require 'date'
  	require 'net/http'
  	require 'json'
  	
  	self.class.module_eval {attr_accessor :has_after_imagery}
	self.has_after_imagery = false
	self.class.module_eval {attr_accessor :has_new_imagery}
	self.has_new_imagery = false
	self.class.module_eval {attr_accessor :newest_imagery_age}
	self.newest_imagery_age = ''
	
	if self.is_active? == false
		return {}
	end
	
	#return {}  # remove this to do anything at all
  	
  	
  	
  	# return the WFS url for this event's BBOX
  	uri = URI.parse('https://services.digitalglobe.com/catalogservice/wfsaccess?layers=DigitalGlobe:CrisisEventFootprint&maxFeatures=75&request=GetFeature&typeName=DigitalGlobe:FinishedFeature&service=wfs&srs=EPSG:4326&version=1.1.1&outputFormat=json&CONNECTID=d739a96d-81a9-4632-9165-d42b4b514cd2&BBOX=30.608963735338,103.29539249809,31.249854264662,103.94306150191')
  	args = {layers: "DigitalGlobe:CrisisEventFootprint", maxFeatures: 75, request: 'GetFeature', typeName: "DigitalGlobe:FinishedFeature", service: "wfs", srs: "EPSG:4326", version: "1.1.1", outputFormat: "json", CONNECTID: "d739a96d-81a9-4632-9165-d42b4b514cd2", BBOX: self.get_bbox_params2 }
  	uri.query = URI.encode_www_form(args)
  	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = true
	http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	http.ssl_version = :SSLv3
	
	request = Net::HTTP::Get.new(uri.request_uri)
	#return uri.request_uri
	request.basic_auth 'FirstLook', 'DG4me'
	response = http.request(request)
	
	featureCollection = JSON.parse response.body
	
	
	#logger.info featureCollection
	
	
	
	
	newest_imagery_age = 5000
	
	featureCollection['features'].map! {|feature|
		if Time.parse(feature['properties']['acquisitionDate']) >= self.event_date
			self.has_after_imagery = Time.parse(feature['properties']['acquisitionDate']) >= self.event_date
		end
		
		if Date.today - 3 <= Date.parse(feature['properties']['acquisitionDate'])
			self.has_new_imagery = true
		end
		
		if feature['properties']['ageDays'] < newest_imagery_age
			newest_imagery_age = feature['properties']['ageDays']
		end
		
		newProperties = {"acquisitionDate"           => feature['properties']['acquisitionDate'],
						 "afterImage"                => Time.parse(feature['properties']['acquisitionDate']) >= self.event_date,        
						 "eventId"                   => self.id,
						 "featureId"                 => feature['properties']['featureId'],
						 "source"                    => feature['properties']['source'],
						 "sourceUnit"                => feature['properties']['sourceUnit'],
						 "productType"               => feature['properties']['productType'],
						 "cloudCover"                => feature['properties']['cloudCover'],
						 "offNadirAngle"             => feature['properties']['offNadirAngle'],
						 "sunElevation"              => feature['properties']['sunElevation'],
						 "sunAzimuth"                => feature['properties']['sunAzimuth'],
						 "groundSampleDistance"      => feature['properties']['groundSampleDistance'],
						 "groundSampleDistanceUnit"  => feature['properties']['groundSampleDistanceUnit'],
						 "colorBandOrder"            => feature['properties']['colorBandOrder'],
						 "legacyId"                  => feature['properties']['legacyId'],
						 "perPixelX"                 => feature['properties']['perPixelX'],
						 "perPixelY"                 => feature['properties']['perPixelY'],
						 "crsFromPixels"             => feature['properties']['crsFromPixels'],
						 "ageDays"                   => feature['properties']['ageDays'],
						 "companyName"               => feature['properties']['companyName'],
						 "copyright"                 => feature['properties']['copyright'],
						 "browseURL"                 => "https://browse.digitalglobe.com/imagefinder/showBrowseMetadata?catalogId=#{feature['properties']['legacyId']}"
						 }
		
		newFeature = { "geometry"   => feature['geometry'],
					   "id"         => feature['id'],
					   "type"       => feature['type'],
					   "properties" => newProperties }
		feature = newFeature
	}
	
	self.newest_imagery_age = newest_imagery_age
	
	return featureCollection

  end
  
  def humanized_active_name
    return "Active" if self.is_active?
    
    return "Inactive"
  end
  
  def word_wrap(text, *args)
    options = args.extract_options!
    unless args.blank?
      options[:line_width] = args[0] || 80
    end
    options.reverse_merge!(:line_width => 80)

    text.split("<br/>").collect do |line|
      line.length > options[:line_width] ? line.gsub(/(.{1,#{options[:line_width]}})(\s+|$)/, "\\1<br/>").strip : line
    end * "<br/>"
  end
  
  def html_formatted_description
    return word_wrap(self.description, :line_width => 70).split("<br/>")
  end
  
  def is_active?
    return false if self.active_start_date.nil? or self.active_end_date.nil?
    
    return true if Time.now > self.active_start_date and Time.now < self.active_end_date
    
    return false
  end  
  
  def kml_description
    des = ""
    des += "<br>Related News: #{self.news_link}" if !self.news_link.blank?
    des += "<br>FirstWatch: #{self.firstwatch_link}" if !self.firstwatch_link.blank?
    return des
  end
  
  def self.search(term)
    self.where("name like ? OR description like ?", "%#{term}%", "%#{term}%")
  end
  
  def self.type(category_id)
    Event.last_365.find(:all, :include => :categories, :conditions => ["categories_events.category_id = ?",category_id],
      :order => "event_date DESC")
  end
    
  def self.last_update
    i = self.unscoped.order("updated_at DESC").first
    i.updated_at
  end
  
  
  protected
  
  def seed_cache_and_website
  	logger.info "seeding and caching website"
    system "ruby script/production_move_cache.rb &" if Rails.env.production?
    system "ruby script/production_move_geojson_cache.rb &" if Rails.env.production?
    system "ruby script/bi_move_cache.rb &" if Rails.env.bi?
    system "ruby script/development_move_cache.rb &" if Rails.env.development?
  end
  
  private
  
  def at_least_one_environment_is_selected
    errors.add(:base, "Please select at least one environment for this event") unless available_in_r3 || available_in_commercial
  end
  
end
