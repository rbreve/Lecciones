class LessonPsector < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :productive_sector
end
