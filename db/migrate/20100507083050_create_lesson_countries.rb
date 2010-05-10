class CreateLessonCountries < ActiveRecord::Migration
  def self.up
    create_table :lesson_countries do |t|
      t.integer :lesson_id
      t.integer :lcountry_id

      t.timestamps
    end
  end

  def self.down
    drop_table :lesson_countries
  end
end
