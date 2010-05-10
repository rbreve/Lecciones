require 'test_helper'

class ResultadosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Resultado.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Resultado.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Resultado.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to resultado_url(assigns(:resultado))
  end
  
  def test_edit
    get :edit, :id => Resultado.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Resultado.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Resultado.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Resultado.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Resultado.first
    assert_redirected_to resultado_url(assigns(:resultado))
  end
  
  def test_destroy
    resultado = Resultado.first
    delete :destroy, :id => resultado
    assert_redirected_to resultados_url
    assert !Resultado.exists?(resultado.id)
  end
end
