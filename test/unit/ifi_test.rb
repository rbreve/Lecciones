require 'test_helper'

class IfiTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Ifi.new.valid?
  end
end
