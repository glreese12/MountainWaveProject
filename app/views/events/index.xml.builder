xml.div(:class => "events") do
  xml.lastUpdate(Event.last_update)
  @events.each do |event| 
      xml.event do
        xml.eventId(event.id)
        xml.name(event.name)
        xml.description(event.description)
        xml.image_url(event.external_image_url)
        xml.latitude(event.latitude)
        xml.longitude(event.longitude)
        xml.aoi_size(event.aoi_size)
        xml.eventDate(event.event_date)
        xml.active(event.is_active?)
        xml.news_url(event.news_link)
        xml.firstwatch_url(event.firstwatch_link)
        xml.categories(event.categories.map{|cat| cat.name}.join(","))
        xml.points_of_interest do
          event.point_of_interests.each do |poi|
            xml.point_of_interest do
              xml.title(poi.name)
              xml.description(poi.description)
              xml.has_recent_imagery(poi.has_recent_imagery)
              xml.latitude(poi.latitude)
              xml.longitude(poi.longitude)
            end
          end
        end
      end
  end 
end