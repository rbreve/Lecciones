require 'test_helper'

class LcountryTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Lcountry.new.valid?
  end
end
