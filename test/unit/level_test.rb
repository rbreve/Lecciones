require 'test_helper'

class LevelTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Level.new.valid?
  end
end
