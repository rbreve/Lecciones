class CreateLeccionTypes < ActiveRecord::Migration
  def self.up
    create_table :leccion_types do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
  
  def self.down
    drop_table :leccion_types
  end
end
