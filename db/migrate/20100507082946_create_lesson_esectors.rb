class CreateLessonEsectors < ActiveRecord::Migration
  def self.up
    create_table :lesson_esectors do |t|
      t.integer :lesson_id
      t.integer :empresarial_sector_id

      t.timestamps
    end
  end

  def self.down
    drop_table :lesson_esectors
  end
end
