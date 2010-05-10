require 'test_helper'

class ProductiveSectorTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ProductiveSector.new.valid?
  end
end
