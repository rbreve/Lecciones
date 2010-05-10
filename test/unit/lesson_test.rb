require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Lesson.new.valid?
  end
end
