class EmpresarialSector < ActiveRecord::Base
  attr_accessible :name
 
 has_many :lesson_esector
 has_many :lessons, :through => :lesson_esectors
end
