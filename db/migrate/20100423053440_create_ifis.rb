class CreateIfis < ActiveRecord::Migration
  def self.up
    create_table :ifis do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :ifis
  end
end
