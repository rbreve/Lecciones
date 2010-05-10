class Ificontactinfo < ActiveRecord::Migration
  def self.up
    add_column :ifis, :contact_name, :string
    add_column :ifis, :contact_phone, :string
    add_column :ifis, :contact_email, :string
  end

  def self.down
  end
end
