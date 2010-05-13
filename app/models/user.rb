class User < ActiveRecord::Base
  devise :database_authenticatable, :confirmable, :recoverable,
         :rememberable, :registerable, :trackable, :timeoutable, :validatable

  attr_accessible :country_id, :ifi_id, :name, :username, :email, :password, :password_confirmation, :ispublic, :institucion
  
  belongs_to :country
  belongs_to :ifi
  
  validates_presence_of :name, :username
  
end
