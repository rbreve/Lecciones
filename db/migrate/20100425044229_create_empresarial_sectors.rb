class CreateEmpresarialSectors < ActiveRecord::Migration
  def self.up
    create_table :empresarial_sectors do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :empresarial_sectors
  end
end
