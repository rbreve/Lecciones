require 'test_helper'

class AmbitosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Ambito.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Ambito.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Ambito.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to ambito_url(assigns(:ambito))
  end
  
  def test_edit
    get :edit, :id => Ambito.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Ambito.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Ambito.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Ambito.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Ambito.first
    assert_redirected_to ambito_url(assigns(:ambito))
  end
  
  def test_destroy
    ambito = Ambito.first
    delete :destroy, :id => ambito
    assert_redirected_to ambitos_url
    assert !Ambito.exists?(ambito.id)
  end
end
