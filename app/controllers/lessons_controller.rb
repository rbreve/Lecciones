require 'fastercsv'

class LessonsController < ApplicationController
before_filter :authenticate_admin!, :only => [:edit, :update]


  def index
    q=params[:q]
    
    @country_id=params[:country_id]
		@ambito_id=params[:ambito_id]
		@level_id=params[:level_id]
		@esector_id=params[:esector_id]
		@from_date = params[:from_date]
		@to_date = params[:to_date]
		@aprobada=params[:aprobada]
		
		export = params[:csv]
    query=""
    extern=""
    
    date=Time.now
    @last_week=(date-(60*60*24*7)).strftime("%Y-%m-%d")
    @last_month=(date-(60*60*24*30)).strftime("%Y-%m-%d")
    
		@countries = Lcountry.find(:all, :order => "orden ASC")
		@ambitos = Ambito.find(:all)
		@levels = Level.find(:all)
		@sectores = EmpresarialSector.find(:all, :order => "orden ASC")
		
		
    if admin_signed_in?
      @newlessons=Lesson.not_approved.length
      unless @aprobada.blank?
        @lessons = Lesson.not_approved
      else
        @lessons= Lesson.all
      end
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
    
    unless q.blank?
      @lessons = @lessons.search(q)
    end

		unless @esector_id.blank?
		  @esector_name=EmpresarialSector.find(@esector_id).name
			unless @country_id.blank?
			  @lessons=@lessons.by_esector_country(@esector_id)
			else
			  @lessons=@lessons.by_esector(@esector_id)
			end
		end

		unless @country_id.blank?
      @country_name = Lcountry.find(@country_id).name
      @lessons = @lessons.by_country(@country_id)
		end
		
		unless @ambito_id.blank?
		  @ambito_name = Ambito.find(@ambito_id).name
			@lessons = @lessons.by_ambito(@ambito_id)
		end
		
		unless @level_id.blank?
		  @level_name=Level.find(@level_id).name
			@lessons = @lessons.by_level(@level_id)
		end
		
		unless @from_date.blank?
		  @lessons = @lessons.from_date(@from_date)
		end
  

    respond_to do |format|
      format.html 
      format.csv do
        print @lessons.length
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
        flash[:notice] = "Gracias, su lección fue recibida, será revisada por un administrador para su aprobación ."
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
