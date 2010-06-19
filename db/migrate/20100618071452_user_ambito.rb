class UserAmbito < ActiveRecord::Migration
  def self.up
	    add_column :users, :ambito_id, :integer
  end

  def self.down
  end
end
