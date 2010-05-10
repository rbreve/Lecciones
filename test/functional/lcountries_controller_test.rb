require 'test_helper'

class LcountriesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Lcountry.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Lcountry.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Lcountry.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to lcountry_url(assigns(:lcountry))
  end
  
  def test_edit
    get :edit, :id => Lcountry.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Lcountry.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Lcountry.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Lcountry.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Lcountry.first
    assert_redirected_to lcountry_url(assigns(:lcountry))
  end
  
  def test_destroy
    lcountry = Lcountry.first
    delete :destroy, :id => lcountry
    assert_redirected_to lcountries_url
    assert !Lcountry.exists?(lcountry.id)
  end
end
