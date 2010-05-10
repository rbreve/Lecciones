class LessonResult < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :resultado
end
