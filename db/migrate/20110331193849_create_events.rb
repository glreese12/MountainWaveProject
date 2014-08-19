class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.string :description
      t.float :latitude
      t.float :longitude
      t.datetime :eventDate
      t.boolean :active

      t.timestamps
      
      t.string :thumbnail_file_name
      t.string :thumbnail_content_type
      t.integer :thumbnail_file_size
      t.datetime :thumbnail_updated_at
    end
  end

  def self.down
    drop_table :events
  end
end
