class Resultado < ActiveRecord::Base
  attr_accessible :name, :description
  
  has_many :lesson_results, :dependent => :destroy      
  has_many :lessons, :through => :lessons_results
  
end
