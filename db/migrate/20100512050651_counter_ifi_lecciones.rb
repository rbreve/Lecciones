class CounterIfiLecciones < ActiveRecord::Migration
  def self.up
    add_column :ifis, :lessons_count, :integer
  end

  def self.down
  end
end
