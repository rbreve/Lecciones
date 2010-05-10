class Lesson < ActiveRecord::Base
  # attr_accessible :name, :description, :created_at, :isprivate, :ambito_id, :ifi_id, :leccion_type_id, :level_id, :origin_id, :resultado_id, :producto_id, :empresarial_sector_id, :productive_sector_id, :lcountry_ids, :user_id
  belongs_to :ambito
  belongs_to :ifi
  belongs_to :leccion_type
  belongs_to :level
  belongs_to :origin
  belongs_to :user
  
  has_many :resultados, :through => :lesson_results
  has_many :productos, :through => :lesson_products
  has_many :empresarial_sectors, :through => :lesson_esectors
  has_many :productive_sectors, :through => :lesson_psectors
  
  has_many :lesson_countries
  has_many :lcountries, :through => :lesson_countries
  
  has_many :lesson_results
  has_many :resultados, :through => :lesson_results
  
  has_many :lesson_products
  has_many :productos, :through => :lesson_products
  
  has_many :lesson_psectors
  has_many :productive_sectors, :through => :lesson_psectors
  
  has_many :lesson_esectors
  has_many :emrpesarial_sectors, :through => :lesson_esectors
  
  validates_presence_of :name, :description
   
end
