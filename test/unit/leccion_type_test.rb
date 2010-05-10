require 'test_helper'

class LeccionTypeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert LeccionType.new.valid?
  end
end
