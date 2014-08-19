class Category < ActiveRecord::Base
  has_and_belongs_to_many :events
  
  validates_attachment_presence :thumbnail
  validates :name, :description, :presence => true
  has_attached_file :thumbnail, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  def external_image_url
    File.join(BASE_IMAGE_URL, self.thumbnail_file_name.gsub(/\.jpg|\.jpeg|\.gif/,".png"))
  end
  
  def as_json(options = {})
      {
        categoryId: self.id,
        name: self.name,
        description: self.description,
        imageUrl: self.external_image_url, 
      }
  end
  
  def self.get_category_for_name(name)
    Category.where("name = ?","%#{name}")
  end
  
  def self.last_update
    i = self.unscoped.order("updated_at DESC").first
    i.updated_at
  end
  
end
