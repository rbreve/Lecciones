require 'test_helper'

class OriginTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Origin.new.valid?
  end
end
