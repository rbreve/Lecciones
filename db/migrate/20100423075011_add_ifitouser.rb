class AddIfitouser < ActiveRecord::Migration
  def self.up
    add_column :users, :ifi_id, :integer
  end

  def self.down
  end
end
