class Producto < ActiveRecord::Base
  attr_accessible :name
  
  has_many :lesson_products
  has_many :lessons, :through => :lessons_products   
  
  validates_presence_of :name  
end
