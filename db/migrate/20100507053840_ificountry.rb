class Ificountry < ActiveRecord::Migration
  def self.up
    add_column :ifis, :country_id, :integer
  end

  def self.down
    drop_column :ifis, :country_id, :integer
  end
end
