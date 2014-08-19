class RenameEventdateColumnName < ActiveRecord::Migration
  def self.up
    rename_column :events, :eventDate, :event_date
  end

  def self.down
    rename_column :events, :event_date, :eventDate
  end
end
