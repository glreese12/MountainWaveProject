class Icon < ActiveRecord::Base  
  validate :name, :presence
  validates  :name, uniqueness: true  
  
  validates_attachment_presence :thumbnail
  validate :check_file_dimensions, :unless => "errors.any?"
  
  has_attached_file :thumbnail, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  has_many :events
  
  def check_file_dimensions
    dimensions = Paperclip::Geometry.from_file(thumbnail.to_file(:original))
    if dimensions.width < 72 and dimensions.height < 72
      errors.add(:thumbnail,'width or height must be at least 72px')
    end
  end
  
  
end
