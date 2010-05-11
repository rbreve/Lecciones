class Admin < ActiveRecord::Base
  devise :database_authenticatable,  :timeoutable, :validatable, :timeout_in => 90.minutes
end
