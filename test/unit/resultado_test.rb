require 'test_helper'

class ResultadoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Resultado.new.valid?
  end
end
