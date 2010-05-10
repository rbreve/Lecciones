class CreateLessonPsectors < ActiveRecord::Migration
  def self.up
    create_table :lesson_psectors do |t|
      t.integer :lesson_id
      t.integer :productive_sector_id

      t.timestamps
    end
  end

  def self.down
    drop_table :lesson_psectors
  end
end
