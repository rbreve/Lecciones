require 'test_helper'

class CountriesTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Countries.new.valid?
  end
end
