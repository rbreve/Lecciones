class Help < ActiveRecord::Base
  attr_accessible :code, :title, :description
  validates_presence_of :code,:title,:description
end
