class Lesson < ActiveRecord::Base
  # attr_accessible :name, :description, :created_at, :isprivate, :ambito_id, :ifi_id, :leccion_type_id, :level_id, :origin_id, :resultado_id, :producto_id, :empresarial_sector_id, :productive_sector_id, :lcountry_ids, :user_id
 

  belongs_to :ambito
  belongs_to :ifi, :counter_cache => true
  belongs_to :leccion_type
  belongs_to :level
  belongs_to :origin
  belongs_to :user
  
  has_many :comments
  
  has_many :resultados, :through => :lesson_results
  has_many :productos, :through => :lesson_products
  has_many :empresarial_sectors, :through => :lesson_esectors
  has_many :productive_sectors, :through => :lesson_psectors
  
  has_many :lesson_countries
  has_many :lcountries, :through => :lesson_countries
  
  has_many :lesson_results, :dependent => :destroy      
  has_many :resultados, :through => :lesson_results
  
  has_many :lesson_products
  has_many :productos, :through => :lesson_products
  
  has_many :lesson_psectors
  has_many :productive_sectors, :through => :lesson_psectors
  
  has_many :lesson_esectors
  has_many :empresarial_sectors, :through => :lesson_esectors
  
  validates_presence_of :name, :description
  named_scope :all, :conditions =>"1=1",:order=>"lessons.created_at DESC"
  named_scope :external, :conditions => { :isprivate => FALSE } , :order=>"lessons.created_at DESC"
  named_scope :approved, :conditions => {:aprobada => TRUE}, :order=>"lessons.created_at DESC"
  named_scope :not_approved, :conditions => {:aprobada => nil}, :order=>"lessons.created_at DESC"
  named_scope :search, lambda { |q|
  		{ 
				:conditions => ["name like ?", "%" + q + "%"] 
			}
  }

	named_scope :by_esector, lambda { |s|
		{
			:select => "lesson_esectors.*, lessons.*", 
			:from => "lessons, lesson_esectors, empresarial_sectors",
			:conditions => "lesson_esectors.lesson_id = lessons.id AND lesson_esectors.empresarial_sector_id = " + s + " AND empresarial_sectors.id="+ s
		}
	}
	
	named_scope :by_esector_country, lambda { |s|
		{
			:select => "lesson_esectors.*, lessons.*", 
			:from => "lessons, lesson_esectors, empresarial_sectors,lesson_countries, lcountries",
			:conditions => "lesson_esectors.lesson_id = lessons.id AND lesson_esectors.empresarial_sector_id = " + s + " AND empresarial_sectors.id="+ s
		}
	}

	
	named_scope :by_country, lambda { |c|
		{
		:select => "lesson_countries.*, lessons.*",
		:from =>"lessons, lesson_countries, lcountries",
		:conditions => "lesson_countries.lesson_id = lessons.id AND lesson_countries.lcountry_id = " + c + " AND lcountries.id=" + c
		}
	}
	
	named_scope :by_ambito, lambda { |a|
		{
 			:conditions => ["lessons.ambito_id = ?", a]
		}
	}
	
	named_scope :from_date, lambda { |d|
	  {
	   :conditions => ["lessons.created_at >= ?", d]
	  }
	}
	
	named_scope :by_level, lambda { |l|
		{
			:conditions => ["lessons.level_id = ?", l]
		}
	}
	
end
