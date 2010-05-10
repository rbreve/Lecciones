require 'test_helper'

class OriginsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Origin.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Origin.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Origin.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to origin_url(assigns(:origin))
  end
  
  def test_edit
    get :edit, :id => Origin.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Origin.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Origin.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Origin.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Origin.first
    assert_redirected_to origin_url(assigns(:origin))
  end
  
  def test_destroy
    origin = Origin.first
    delete :destroy, :id => origin
    assert_redirected_to origins_url
    assert !Origin.exists?(origin.id)
  end
end
