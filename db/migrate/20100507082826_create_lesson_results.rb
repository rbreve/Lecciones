class CreateLessonResults < ActiveRecord::Migration
  def self.up
    create_table :lesson_results do |t|
      t.integer :lesson_id
      t.integer :resultado_id

      t.timestamps
    end
  end

  def self.down
    drop_table :lesson_results
  end
end
