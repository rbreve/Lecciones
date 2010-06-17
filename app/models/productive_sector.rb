class ProductiveSector < ActiveRecord::Base
  attr_accessible :name
  
  has_many :ifisectorizations
  has_many :ifis, :through => :ifisectorization
  
  has_many :lesson_eproducts
  has_many :lessons, :through => :lesson_eproducts
  
end