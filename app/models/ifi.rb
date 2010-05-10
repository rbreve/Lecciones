class Ifi < ActiveRecord::Base
  # attr_accessible :name, :productive_sectors
  has_many :users
  has_many :ifisectorizations
  has_many :productive_sectors, :through => :ifisectorizations
  belongs_to :lcountry
end
