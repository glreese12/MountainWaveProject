xml.instruct! :xml
xml.kml(:xmlns => "http://earth.google.com/kml/2.2") do
  xml.Document {
    @events.each do |event|
      xml.Document {
        xml.name(event.name)
        xml.Placemark {
          xml.name(event.name)
          xml.description(event.description + event.kml_description)
          xml.Style {
            xml.LabelStyle {
              xml.scale(0)
            }
            xml.IconStyle {
              xml.Icon {
                xml.href(event.external_image_url)
              }
            }
          }
          xml.Point {
            xml.coordinates("#{event.longitude}, #{event.latitude},0.0");
          }       
        }
        event.point_of_interests.each do |point_of_interest|
          xml.Placemark {
            xml.name(point_of_interest.name)
            xml.description(point_of_interest.description)
            xml.Point {
              xml.coordinates("#{point_of_interest.longitude}, #{point_of_interest.latitude},0.0");
            }
          }
        end
      }   
    end
  }
end