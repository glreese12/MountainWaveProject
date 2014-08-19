class AddNewsLinkToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :news_link, :string
  end

  def self.down
    remove_column :events, :news_link
  end
end
