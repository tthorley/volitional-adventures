class AddPasswordSalt < ActiveRecord::Migration
  def self.up
    add_column :authors, :password_salt, :string, :limit => 8
  end

  def self.down
    remove_column :authors, :password_salt
  end
end