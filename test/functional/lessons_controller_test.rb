require 'test_helper'

class LessonsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Lesson.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Lesson.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Lesson.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to lesson_url(assigns(:lesson))
  end
  
  def test_edit
    get :edit, :id => Lesson.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Lesson.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Lesson.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Lesson.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Lesson.first
    assert_redirected_to lesson_url(assigns(:lesson))
  end
  
  def test_destroy
    lesson = Lesson.first
    delete :destroy, :id => lesson
    assert_redirected_to lessons_url
    assert !Lesson.exists?(lesson.id)
  end
end
