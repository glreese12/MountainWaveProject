json.type 'FeatureCollection'
json.features do

	json.array! @events do |event|
		json.type 'Feature'

		json.geometry do
			json.type "Point"
			json.coordinates  Array.[](event.longitude, event.latitude)
		end

		json.properties do
			json.eventId event.id
			json.name 	event.name.nil? ? "":event.name
			json.description 	event.description.nil? ? "":event.description 
			json.latitude 	event.latitude.nil? ? 0:event.latitude
			json.longitude 	event.longitude.nil? ? 0:event.longitude
			json.imageUrl 	event.external_image_url
			json.aoiSize 	event.aoi_size
			json.eventDate 	event.event_date
			json.active 	event.is_active?
			json.available_in_commercial 	event.available_in_commercial
			json.available_in_r3 	event.available_in_r3
			json.newsUrl 	event.news_link.nil? ? "":event.news_link
			json.firstwatchUrl 	event.firstwatch_link.nil? ? "":event.firstwatch_link
			json.glideNumber 	event.glide_number.nil? ? "":event.glide_number
			json.eventLabel 	event.event_label.nil? ? "":event.event_label
			json.categories 	event.categories.map{|cat| cat.name}.join("")
			json.points_of_interest 	event.point_of_interests
			json.features 	event.get_wfs_features
			json.has_after_imagery 	event.has_after_imagery
			json.has_new_imagery 	event.has_new_imagery
			json.newest_imagery_age 	event.newest_imagery_age
		end

	end

end
