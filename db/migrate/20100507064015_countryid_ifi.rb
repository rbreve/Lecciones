class CountryidIfi < ActiveRecord::Migration
  def self.up
     add_column :ifis, :lcountry_id, :integer
   end

   def self.down
     drop_column :ifis, :lcountry_id, :integer
   end
end
