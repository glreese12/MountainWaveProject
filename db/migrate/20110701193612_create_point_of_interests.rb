class CreatePointOfInterests < ActiveRecord::Migration
  def self.up
    create_table :point_of_interests do |t|
      t.integer :event_id
      t.string :name
      t.text :description
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end

  def self.down
    drop_table :point_of_interests
  end
end
