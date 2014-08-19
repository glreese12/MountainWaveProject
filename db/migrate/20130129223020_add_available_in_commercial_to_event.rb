class AddAvailableInCommercialToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :available_in_commercial, :boolean, :default => true
    Event.update_all ["available_in_commercial = ?", true]
  end

  def self.down
    remove_column :events, :available_in_commercial
  end
end
