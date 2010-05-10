class CreateProductos < ActiveRecord::Migration
  def self.up
    create_table :productos do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :productos
  end
end
