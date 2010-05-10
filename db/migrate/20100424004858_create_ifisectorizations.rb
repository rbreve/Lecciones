class CreateIfisectorizations < ActiveRecord::Migration
  def self.up
    create_table :ifisectorizations do |t|
      t.integer :ifi_id
      t.integer :productive_sector_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ifisectorizations
  end
end
