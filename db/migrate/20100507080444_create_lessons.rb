class CreateLessons < ActiveRecord::Migration
  def self.up
    create_table :lessons do |t|
      t.string :name
      t.text :description
      t.datetime :created_at
      t.boolean :isprivate
      t.integer :ambito_id
      t.integer :ifi_id
      t.integer :leccion_type_id
      t.integer :level_id
      t.integer :origin_id
      t.integer :resultado_id
      t.integer :producto_id
      t.integer :empresarial_sector_id
      t.integer :productive_sector_id
      t.integer :lcountry_id
      t.integer :user_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :lessons
  end
end
