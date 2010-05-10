class NewUserFields < ActiveRecord::Migration
  def self.up
    add_column :users, :username, :string, :unique => true
    add_column :users, :name, :string, :unique => true
    add_column :users, :country_id, :integer
  end

  def self.down
  end
end
