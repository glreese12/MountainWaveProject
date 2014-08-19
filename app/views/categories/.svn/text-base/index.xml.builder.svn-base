xml.div(:class => "categories") do
  xml.lastUpdate(Category.last_update)
  @categories.each do |category| 
      xml.category do
        xml.categoryId(category.id)
        xml.name(category.name)
        xml.description(category.description)
        xml.image_url(category.external_image_url)
      end
  end 
end