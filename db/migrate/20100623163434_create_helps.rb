class CreateHelps < ActiveRecord::Migration
  def self.up
    create_table :helps do |t|
      t.string :code, :limit=>"50"
      t.string :title
      t.text :description
      t.timestamps
    end
  end
  
  def self.down
    drop_table :helps
  end
end
