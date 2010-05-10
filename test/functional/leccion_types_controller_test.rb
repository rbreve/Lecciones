require 'test_helper'

class LeccionTypesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => LeccionType.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    LeccionType.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    LeccionType.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to leccion_type_url(assigns(:leccion_type))
  end
  
  def test_edit
    get :edit, :id => LeccionType.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    LeccionType.any_instance.stubs(:valid?).returns(false)
    put :update, :id => LeccionType.first
    assert_template 'edit'
  end
  
  def test_update_valid
    LeccionType.any_instance.stubs(:valid?).returns(true)
    put :update, :id => LeccionType.first
    assert_redirected_to leccion_type_url(assigns(:leccion_type))
  end
  
  def test_destroy
    leccion_type = LeccionType.first
    delete :destroy, :id => leccion_type
    assert_redirected_to leccion_types_url
    assert !LeccionType.exists?(leccion_type.id)
  end
end
