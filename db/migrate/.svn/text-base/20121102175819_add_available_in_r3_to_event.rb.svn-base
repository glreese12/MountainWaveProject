class AddAvailableInR3ToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :available_in_r3, :boolean, :default => false
    Event.update_all ["available_in_r3 = ?", false]
  end

  def self.down
    remove_column :events, :available_in_r3
  end
end
