class AddhasRecentImageryTopointOfInterests < ActiveRecord::Migration
  def self.up
    add_column :point_of_interests, :has_recent_imagery, :boolean, :default => false
    PointOfInterest.update_all ["has_recent_imagery = ?", false]
  end

  def self.down
	remove_column :point_of_interests, :has_recent_imagery
  end
end
