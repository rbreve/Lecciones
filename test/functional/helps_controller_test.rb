require 'test_helper'

class HelpsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Help.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Help.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Help.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to help_url(assigns(:help))
  end
  
  def test_edit
    get :edit, :id => Help.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Help.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Help.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Help.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Help.first
    assert_redirected_to help_url(assigns(:help))
  end
  
  def test_destroy
    help = Help.first
    delete :destroy, :id => help
    assert_redirected_to helps_url
    assert !Help.exists?(help.id)
  end
end
