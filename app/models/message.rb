class Message < ActiveRecord::Base
  attr_accessible :name, :country, :email, :content
	 validates_presence_of :name, :country, :email, :content

end
