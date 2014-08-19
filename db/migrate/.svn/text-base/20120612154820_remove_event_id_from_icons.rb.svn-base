class RemoveEventIdFromIcons < ActiveRecord::Migration
  def self.up
    remove_column :icons, :event_id
  end

  def self.down
    add_column :icons, :event_id, :integer
  end
end
