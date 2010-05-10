require 'test_helper'

class LeccionsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Leccion.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Leccion.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Leccion.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to leccion_url(assigns(:leccion))
  end
  
  def test_edit
    get :edit, :id => Leccion.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Leccion.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Leccion.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Leccion.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Leccion.first
    assert_redirected_to leccion_url(assigns(:leccion))
  end
  
  def test_destroy
    leccion = Leccion.first
    delete :destroy, :id => leccion
    assert_redirected_to leccions_url
    assert !Leccion.exists?(leccion.id)
  end
end
