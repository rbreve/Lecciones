class Usertype < ActiveRecord::Migration
  def self.up
    add_column :users, :tipo, :string
    add_column :users, :ispublic, :boolean
    add_column :users, :institucion, :string
  end

  def self.down
  end
end
