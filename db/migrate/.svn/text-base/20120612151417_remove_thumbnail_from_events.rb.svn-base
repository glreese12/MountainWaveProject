class RemoveThumbnailFromEvents < ActiveRecord::Migration
  def self.up
    remove_column :events, :thumbnail_file_name
    remove_column :events, :thumbnail_content_type
    remove_column :events, :thumbnail_file_size
    remove_column :events, :thumbnail_updated_at    
  end

  def self.down
    add_column :events, :thumbnail_file_name, :string
    add_column :events,:thumbnail_content_type, :string
    add_column :events, :thumbnail_file_size, :integer
    add_column :events, :thumbnail_updated_at, :datetime
  end
end
