class LessonsController < ApplicationController
before_filter :authenticate_admin!, :only => [:edit, :update]


  def index
    q=params[:q]
    
    query=""
    extern=""
    
    if admin_signed_in?
      @lessons = Lesson.find(:all, :order=>"created_at DESC")
    elsif not user_signed_in?
      @lessons=Lesson.external.approved
    else
      if current_user
          if current_user.ispublic:
            @lessons=Lesson.external.approved
          else
            @lessons=Lesson.approved
          end
      end
    end
    
    if q.to_s != ""
      @lessons = @lessons.search(q)
    end
    
  end
  
  def show
    @lesson = Lesson.find(params[:id])
  end
  
  def new
    @lesson = Lesson.new
  end
  
  def create
    @lesson = Lesson.new(params[:lesson])
 
    @lesson.user=current_user
    if @lesson.save
      
      if admin_signed_in?
        flash[:notice] = "La lección fue creada"
      else
        flash[:notice] = "La lección fue recibida y sera revisada por un administrador."
      end
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
