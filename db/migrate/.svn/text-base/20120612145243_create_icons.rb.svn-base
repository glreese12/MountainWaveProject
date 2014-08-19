class CreateIcons < ActiveRecord::Migration
  def self.up
    create_table :icons do |t|
      t.string :name
      t.string :thumbnail_file_name
      t.string :thumbnail_content_type
      t.integer :thumbnail_file_size
      t.datetime :thumbnail_updated_at
      
      t.timestamps
    end
  end

  def self.down
    drop_table :icons
  end
end
