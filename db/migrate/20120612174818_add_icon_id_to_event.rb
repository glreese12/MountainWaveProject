class AddIconIdToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :icon_id, :integer
  end

  def self.down
    remove_column :events, :icon_id
  end
end
