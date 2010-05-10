class CreateResultados < ActiveRecord::Migration
  def self.up
    create_table :resultados do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
  
  def self.down
    drop_table :resultados
  end
end
