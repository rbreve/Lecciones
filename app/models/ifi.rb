class Ifi < ActiveRecord::Base
  # attr_accessible :name, :productive_sectors
  has_many :users
  has_many :ifisectorizations
  has_many :productive_sectors, :through => :ifisectorizations
  belongs_to :lcountry
  has_many :lessons
  
  
  named_scope :all, :conditions => "deleted=FALSE", :order=>"ifis.name DESC"
 
  named_scope :by_psector, lambda { |p|
		{
			:select => "ifisectorizations.*, ifis.*", 
			:from => "ifis, ifisectorizations, productive_sectors",
			:conditions => "ifisectorizations.ifi_id = ifis.id AND ifisectorizations.productive_sector_id = " + p + " AND productive_sectors.id="+ p
		}
	}
	
 	
	
	named_scope :by_country, lambda { |c|
		{
 			:conditions => ["lcountry_id = ?", c]
		}
	}
 
	

end
