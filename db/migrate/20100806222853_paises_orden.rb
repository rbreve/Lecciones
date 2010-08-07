class PaisesOrden < ActiveRecord::Migration
  def self.up
    add_column :lcountries, :order, :integer
    add_column :empresarial_sectors, :order, :integer
    add_column :productive_sectors, :order, :integer
    
  end

  def self.down
  end
end
