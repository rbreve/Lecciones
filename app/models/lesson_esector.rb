class LessonEsector < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :empresarial_sector
end
