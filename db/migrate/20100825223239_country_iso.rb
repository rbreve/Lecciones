class CountryIso < ActiveRecord::Migration
  def self.up
    add_column :countries, :iso_code, :string
  end

  def self.down
  end
end
