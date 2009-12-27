class AddUrlizedTitleToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :urlized_title, :string, :limit => 64
  end

  def self.down
    remove_column :books, :urlized_title
  end
end