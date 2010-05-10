require 'test_helper'

class ProductosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Producto.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Producto.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Producto.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to producto_url(assigns(:producto))
  end
  
  def test_edit
    get :edit, :id => Producto.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Producto.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Producto.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Producto.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Producto.first
    assert_redirected_to producto_url(assigns(:producto))
  end
  
  def test_destroy
    producto = Producto.first
    delete :destroy, :id => producto
    assert_redirected_to productos_url
    assert !Producto.exists?(producto.id)
  end
end
