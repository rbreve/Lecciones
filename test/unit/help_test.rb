require 'test_helper'

class HelpTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Help.new.valid?
  end
end
