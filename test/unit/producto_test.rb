require 'test_helper'

class ProductoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Producto.new.valid?
  end
end
