class Lcountry < ActiveRecord::Base
  attr_accessible :name, :order
  
  has_many :ifis
  has_many :lessons , :through => :lesson_country
end
