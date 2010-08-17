class Comment < ActiveRecord::Base
  attr_accessible :user_id, :lesson_id, :content, :created_at
  belongs_to :lesson
  belongs_to :user
end
