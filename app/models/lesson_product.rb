class LessonProduct < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :producto
end
