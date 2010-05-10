class CreateLcountries < ActiveRecord::Migration
  def self.up
    create_table :lcountries do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :lcountries
  end
end
