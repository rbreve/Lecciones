class Lessonactivation < ActiveRecord::Migration
  def self.up
    add_column :lessons, :aprobada, :boolean
  end

  def self.down
  end
end
