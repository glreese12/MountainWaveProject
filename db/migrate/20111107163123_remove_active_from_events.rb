class RemoveActiveFromEvents < ActiveRecord::Migration
  def self.up
    remove_column :events, :active
  end

  def self.down
    add_column :events, :active, :boolean
  end
end
