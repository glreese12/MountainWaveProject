xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0", "xmlns:georss" => "http://www.georss.org/georss" do
  xml.channel do
    xml.title "DigitalGlobe FirstLook Messaging Service"
    xml.description "GeoRSS event-based messaging service"
    xml.copyright "DigitalGlobe 2012"
    xml.author "DigitalGlobe Inc."
    xml.ttl "60"
    
    @events.each do |event| 
        xml.item do
          xml.eventId(event.id)
          xml.title(event.name)
          xml.description(event.description)
          xml.pubDate(event.created_at.rfc2822)
          xml.image(event.external_image_url)
          xml.nothing("hello")
          xml.tag!("georss:point","#{event.latitude} #{event.longitude}")
          xml.aoi_size(event.aoi_size)
          xml.tag!("georss:bbox","#{event.get_bbox_params}") 
          xml.tag!("georss:bbox2","#{event.get_bbox_params2}") 
          xml.active(event.is_active?)
          xml.categories(event.categories.map{|cat| cat.name}.join(","))
          xml.eventDate(event.event_date)
          xml.news_url(event.news_link)
          xml.firstwatch_url(event.firstwatch_link)
          xml.points_of_interest do
            event.point_of_interests.each do |poi|
              xml.point_of_interest do
                xml.title(poi.name)
                xml.description(poi.description)
                xml.has_recent_imagery(poi.has_recent_imagery)
                xml.tag!("georss:point","#{poi.latitude} #{poi.longitude}")
              end
            end
          end
        end
    end
  end
end