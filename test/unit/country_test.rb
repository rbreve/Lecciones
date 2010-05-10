require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Country.new.valid?
  end
end
