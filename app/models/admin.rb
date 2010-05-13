class Admin < ActiveRecord::Base
  devise :database_authenticatable,  :timeoutable, :validatable, :registerable, :timeout_in => 90.minutes
end
