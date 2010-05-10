class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
  end
  
  def show
    @lesson = Lesson.find(params[:id])
  end
  
  def new
    @lesson = Lesson.new
  end
  
  def create
    @lesson = Lesson.new(params[:lesson])
    if @lesson.save
      flash[:notice] = "Successfully created lesson."
      redirect_to @lesson
    else
      render :action => 'new'
    end
  end
  
  def edit
    @lesson = Lesson.find(params[:id])
  end
  
  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update_attributes(params[:lesson])
      flash[:notice] = "Successfully updated lesson."
      redirect_to @lesson
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    flash[:notice] = "Successfully destroyed lesson."
    redirect_to lessons_url
  end
end
