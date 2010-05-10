require 'test_helper'

class SectorEmpresarialTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert SectorEmpresarial.new.valid?
  end
end
