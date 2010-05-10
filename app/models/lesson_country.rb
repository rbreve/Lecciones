class LessonCountry < ActiveRecord::Base
  
  belongs_to :lesson
  belongs_to :lcountry
end
