class Resultado < ActiveRecord::Base
  attr_accessible :name, :description
  
  has_many :lesson_results
  has_many :lessons, :through => :lessons_results
  
end
