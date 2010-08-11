class Statusesparaborrar < ActiveRecord::Migration
  def self.up
      add_column :empresarial_sectors, :deleted, :boolean, :default => false
      add_column :productive_sectors, :deleted, :boolean, :default => false
      add_column :ifis, :deleted, :boolean, :default => false
      add_column :productos, :deleted, :boolean, :default => false
      
  end

  def self.down
  end
end
