class CreateLessonProducts < ActiveRecord::Migration
  def self.up
    create_table :lesson_products do |t|
      t.integer :lesson_id
      t.integer :producto_id

      t.timestamps
    end
  end

  def self.down
    drop_table :lesson_products
  end
end
