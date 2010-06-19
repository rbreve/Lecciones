class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :name
      t.string :country
      t.string :email
      t.text :content
      t.timestamps
    end
  end
  
  def self.down
    drop_table :messages
  end
end
