require 'test_helper'

class IfisControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Ifi.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Ifi.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Ifi.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to ifi_url(assigns(:ifi))
  end
  
  def test_edit
    get :edit, :id => Ifi.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Ifi.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Ifi.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Ifi.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Ifi.first
    assert_redirected_to ifi_url(assigns(:ifi))
  end
  
  def test_destroy
    ifi = Ifi.first
    delete :destroy, :id => ifi
    assert_redirected_to ifis_url
    assert !Ifi.exists?(ifi.id)
  end
end
