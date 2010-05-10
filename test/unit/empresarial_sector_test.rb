require 'test_helper'

class EmpresarialSectorTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert EmpresarialSector.new.valid?
  end
end
