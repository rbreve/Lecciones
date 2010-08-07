class Renameorder < ActiveRecord::Migration
  def self.up
    rename_column :lcountries, :order, :orden
    rename_column :empresarial_sectors, :order, :orden
    rename_column :productive_sectors, :order, :orden
  end

  def self.down
  end
end
