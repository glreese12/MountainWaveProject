class PointOfInterest < ActiveRecord::Base
  belongs_to :event
  
  validates :name, :description, :latitude, :longitude, :event_id, :presence => true
  
  # Return everything directly from the database
  def as_json(options = {})
      {
        poiId: self.id,
        name: self.name.nil? ? "":self.name,
        description: self.description.nil? ? "":self.description, 
        latitude: self.latitude.nil? ? 0:self.latitude,
        longitude: self.longitude.nil? ? 0:self.longitude,
        has_recent_imagery: self.has_recent_imagery      
      }
  end
  
  # Refresh the has_recent_imagery flag by hitting the FL WFS, then return some json.
  # The idea is you will hit the url '/poi/1.json' and that will "refresh" the has_recent_imagery flag in the DB
  def as_json_single(options = {})
      {
        poiId: self.id,
        name: self.name.nil? ? "":self.name,
        description: self.description.nil? ? "":self.description, 
        latitude: self.latitude.nil? ? 0:self.latitude,
        longitude: self.longitude.nil? ? 0:self.longitude,
        has_recent_imagery: self.has_new_imagery      
      }
  end
  
  def get_bbox()
  	# calculate approximate bbox (same as bbox params but with a comma instead of a space)
    p = GeoKit::LatLng.normalize(self.latitude, self.longitude)
    r = 1  # kilometer? not sure
    bounds = GeoKit::Bounds.from_point_and_radius(p,r)
    swNe = bounds.sw.to_s + "," + bounds.ne.to_s
    return swNe
  end
  
  # Hit the WFS, find out if there's recent imagery, and update the has_recent_imagery flag in the DB
  def has_new_imagery()
  	logger.info "inside has_new_imagery()"
	require 'date'
  	require 'net/http'
  	require 'json'
  	
  	has_new_imagery = false
  	
  	uri = URI.parse('https://services.digitalglobe.com/catalogservice/wfsaccess?layers=DigitalGlobe:CrisisEventFootprint&maxFeatures=75&request=GetFeature&typeName=DigitalGlobe:FinishedFeature&service=wfs&srs=EPSG:4326&version=1.1.1&outputFormat=json&CONNECTID=d739a96d-81a9-4632-9165-d42b4b514cd2&BBOX=30.608963735338,103.29539249809,31.249854264662,103.94306150191')
  	args = {layers: "DigitalGlobe:CrisisEventFootprint", maxFeatures: 75, request: 'GetFeature', typeName: "DigitalGlobe:FinishedFeature", service: "wfs", srs: "EPSG:4326", version: "1.1.1", outputFormat: "json", CONNECTID: "d739a96d-81a9-4632-9165-d42b4b514cd2", BBOX: self.get_bbox }
  	uri.query = URI.encode_www_form(args)
  	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = true
	http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	http.ssl_version = :SSLv3
	request = Net::HTTP::Get.new(uri.request_uri)
	request.basic_auth 'FirstLook', 'DG4me'
	response = http.request(request)
	featureCollection = JSON.parse response.body
	
	featureCollection['features'].map! {|feature|
		logger.info feature['properties']['acquisitionDate']
		if Date.today - 3 <= Date.parse(feature['properties']['acquisitionDate'])
			has_new_imagery = true
		end
	}
	
	
	self.has_recent_imagery = has_new_imagery
	# save self, but don't kick off a move_cache process....
	self.save    # I think this is not triggering a move_cache
  	return has_new_imagery
  end
  
  # This function intended to be called from an external ruby script via cron job.  The
  # script should contain "PointOfInterest.updatePoiFeatures", and nothing else.  Run the script
  # via "rails runner script/updatePoiFeatures.rb"
  def self.updatePoiFeatures()
  	logger.info "Running PointOfInterest.updatePoiFeatures"
    pois = PointOfInterest.find(:all)
    pois.each {|poi|
    	poi.has_new_imagery()
    }
    
  end
  
end
