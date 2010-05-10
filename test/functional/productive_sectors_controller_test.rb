require 'test_helper'

class ProductiveSectorsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => ProductiveSector.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    ProductiveSector.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    ProductiveSector.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to productive_sector_url(assigns(:productive_sector))
  end
  
  def test_edit
    get :edit, :id => ProductiveSector.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    ProductiveSector.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ProductiveSector.first
    assert_template 'edit'
  end
  
  def test_update_valid
    ProductiveSector.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ProductiveSector.first
    assert_redirected_to productive_sector_url(assigns(:productive_sector))
  end
  
  def test_destroy
    productive_sector = ProductiveSector.first
    delete :destroy, :id => productive_sector
    assert_redirected_to productive_sectors_url
    assert !ProductiveSector.exists?(productive_sector.id)
  end
end
