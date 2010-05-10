require 'test_helper'

class CountriesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Country.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Country.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Country.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to country_url(assigns(:country))
  end
  
  def test_edit
    get :edit, :id => Country.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Country.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Country.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Country.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Country.first
    assert_redirected_to country_url(assigns(:country))
  end
  
  def test_destroy
    country = Country.first
    delete :destroy, :id => country
    assert_redirected_to countries_url
    assert !Country.exists?(country.id)
  end
end
