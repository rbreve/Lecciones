class User < ActiveRecord::Base
  devise :database_authenticatable, :confirmable, :recoverable,
         :rememberable, :registerable, :trackable, :timeoutable, :validatable, :lockable

  attr_accessible :country_id, :ifi_id, :name, :username, :email, :password, :password_confirmation, :ispublic, :institucion, :ambito_id
  
  belongs_to :country
  belongs_to :ifi
  belongs_to :ambito
  validates_presence_of :name, :username
  has_many :comments
  
end
