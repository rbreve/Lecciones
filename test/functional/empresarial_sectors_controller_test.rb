require 'test_helper'

class EmpresarialSectorsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => EmpresarialSector.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    EmpresarialSector.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    EmpresarialSector.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to empresarial_sector_url(assigns(:empresarial_sector))
  end
  
  def test_edit
    get :edit, :id => EmpresarialSector.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    EmpresarialSector.any_instance.stubs(:valid?).returns(false)
    put :update, :id => EmpresarialSector.first
    assert_template 'edit'
  end
  
  def test_update_valid
    EmpresarialSector.any_instance.stubs(:valid?).returns(true)
    put :update, :id => EmpresarialSector.first
    assert_redirected_to empresarial_sector_url(assigns(:empresarial_sector))
  end
  
  def test_destroy
    empresarial_sector = EmpresarialSector.first
    delete :destroy, :id => empresarial_sector
    assert_redirected_to empresarial_sectors_url
    assert !EmpresarialSector.exists?(empresarial_sector.id)
  end
end
