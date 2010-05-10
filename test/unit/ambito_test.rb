require 'test_helper'

class AmbitoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Ambito.new.valid?
  end
end
