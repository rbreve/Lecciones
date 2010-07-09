require 'fastercsv'

class LessonsController < ApplicationController
before_filter :authenticate_admin!, :only => [:edit, :update]


  def index
    q=params[:q]
    
    @country_id=params[:country_id]
		@ambito_id=params[:ambito_id]
		@level_id=params[:level_id]
		@esector_id=params[:esector_id]
		export = params[:csv]
    query=""
    extern=""
    
		@countries = Country.find(:all)
		@ambitos = Ambito.find(:all)
		@levels = Level.find(:all)
		@sectores = EmpresarialSector.find(:all)
    if admin_signed_in?
      @lessons = Lesson.all
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

		if @esector_id.to_s != ""
			@lessons=@lessons.by_esector(@esector_id)
		end

		if @country_id.to_s != ""
    	 @lessons = @lessons.by_country(@country_id)
		end
		
		if @ambito_id.to_s != ""
			@lessons = @lessons.by_ambito(@ambito_id)
		end
		
		if @level_id.to_s != ""
			@lessons = @lessons.by_level(@level_id)
		end
  
    respond_to do |format|
      format.html 
      format.csv do 
        c=render(:file=>"lessons/index.csv.erb", :layout => false, :locals => {:lessons=>@lessons})
        send_data c
      end
    end
    
   
   end
  
  def show
    @lesson = Lesson.find(params[:id])
  end
  
  def new
		if (not user_signed_in?) and (not admin_signed_in?)
			redirect_to new_message_path()
		end
    @lesson = Lesson.new
		if current_user
			@lesson.ambito = current_user.ambito
		end
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
      flash[:notice] = "La Lección Aprendida fue actualizada con éxito."
      redirect_to @lesson
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.aprobada=FALSE
		@lesson.save
    flash[:notice] = "Lección Borrada"
    redirect_to lessons_url
  end
end
