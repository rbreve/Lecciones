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
        send_data(c, :type => 'text/csv;utf-8;')
      end
    end
    
   
  end
  
  def show
    @lesson = Lesson.find(params[:id])
    @comment = Comment.new
    @comment.lesson=@lesson
    @comments = Comment.find(:all, :conditions=>["lesson_id=?",params[:id]])
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
  
  #---- Accion custom para search
  
  def search                 
   #--- Carga de la DB los listados de parámetros disponibles para filtrar
    @countries = Lcountry.find(:all, :order => "orden ASC")
		@ambitos = Ambito.find(:all)
		@levels = Level.find(:all)
		@esectores = EmpresarialSector.find(:all, :order => "orden ASC")
    @origenes = Origin.find(:all)
    @tipos_leccion = LeccionType.find(:all)
    @psectores = ProductiveSector.find(:all, :order => "orden ASC")
    @resultados = Resultado.find(:all)
    @productos = Producto.find(:all)
    
   #--- Carga del del POST (o deja en array vacios) los listados de parámetros seleccionados por el usuario para la búsqueda...
    @q=params[:q]
		(params[:country_id].nil?) ? @country_id=[] : @country_id=params[:country_id] 
		(params[:ambito_id].blank?) ? @ambito_id=[] : @ambito_id=params[:ambito_id] 
		(params[:level_id].nil?) ? @level_id=[] : @level_id=params[:level_id] 
		(params[:esector_id].nil?) ? @esector_id=[] : @esector_id=params[:esector_id]
    (params[:origen_id].nil?) ? @origen_id=[] : @origen_id=params[:origen_id]
    (params[:tipo_leccion_id].nil?) ? @tipo_leccion_id=[] : @tipo_leccion_id=params[:tipo_leccion_id]
    (params[:psector_id].nil?) ? @psector_id=[] : @psector_id=params[:psector_id]
    (params[:resultado_id].nil?) ? @resultado_id=[] : @resultado_id=params[:resultado_id]
    (params[:producto_id].nil?) ? @producto_id=[] : @producto_id=params[:producto_id]
    
    if request.post?
      #-- Si el request es POST entonces ejecuta la búsqueda...

      #-- Inicializa variables de control ....
  		where_id_in = nil
  		abort_search = false

      #-- Filtro de PAIS 
  		unless @country_id.blank?
        lessons = Lesson.find(:all,:select => "lesson_countries.*, lessons.*",
        :from =>"lessons, lesson_countries, lcountries",
        :conditions => ["lesson_countries.lesson_id = lessons.id AND lesson_countries.lcountry_id = lcountries.id AND lcountries.id IN (#{@country_id.join(",")})"]).map {|x| x.id}
        
        (lessons.empty?) ? abort_search = true : where_id_in = " AND lessons.id IN (#{lessons.join(",")})"
      end
      
      #-- Filtro de AMBITO 
  		unless @ambito_id and not abort_search
        lessons = Lesson.find(:all,:conditions => ["ambito_id IN (#{@ambito_id.join(",")}) #{where_id_in}"]).map {|x| x.id}
        
        (lessons.empty?) ? abort_search = true : where_id_in = " AND lessons.id IN (#{lessons.join(",")})"
      end

      #-- Filtro de TIPO DE LECCION
  		unless @tipo_leccion_id.blank? and not abort_search
        lessons = Lesson.find(:all,:conditions => ["leccion_type_id IN (#{@tipo_leccion_id.join(",")}) #{where_id_in}"]).map {|x| x.id}
        
        (lessons.empty?) ? abort_search = true : where_id_in = " AND lessons.id IN (#{lessons.join(",")})"
      end
      
      #-- Filtro de NIVEL DE RIESGO 
  		unless @level_id.blank? and not abort_search
        lessons = Lesson.find(:all,:conditions => ["level_id IN (#{@level_id.join(",")}) #{where_id_in}"]).map {|x| x.id}
        
        (lessons.empty?) ? abort_search = true : where_id_in = " AND lessons.id IN (#{lessons.join(",")})"
      end

      #-- Filtro de ORIGEN
  		unless @origen_id.blank? and not abort_search
        lessons = Lesson.find(:all,:conditions => ["origin_id IN (#{@origen_id.join(",")}) #{where_id_in}"]).map {|x| x.id}
        
        (lessons.empty?) ? abort_search = true : where_id_in = " AND lessons.id IN (#{lessons.join(",")})"
      end
                                      
      #-- Filtro de SECTOR EMPRESARIAL 
  		unless @esector_id.blank? and not abort_search
        lessons = Lesson.find(:all,:select => "lesson_esectors.*, lessons.*", 
  			:from => "lessons, lesson_esectors, empresarial_sectors",
        :conditions => ["lesson_esectors.lesson_id = lessons.id AND lesson_esectors.empresarial_sector_id = empresarial_sectors.id AND empresarial_sectors.id IN (#{@esector_id.join(",")}) #{where_id_in}"]).map {|x| x.id}

        (lessons.empty?) ? abort_search = true : where_id_in = " AND lessons.id IN (#{lessons.join(",")})"
      end                             
      
      #-- Filtro de SECTOR PRODUCTIVO
  		unless @psector_id.blank? and not abort_search
        lessons = Lesson.find(:all,:select => "lesson_psectors.*, lessons.*", 
  			:from => "lessons, lesson_psectors, productive_sectors",
        :conditions => ["lesson_psectors.lesson_id = lessons.id AND lesson_psectors.productive_sector_id = productive_sectors.id AND productive_sectors.id IN (#{@psector_id.join(",")}) #{where_id_in}"]).map {|x| x.id}

        (lessons.empty?) ? abort_search = true : where_id_in = " AND lessons.id IN (#{lessons.join(",")})"
      end                            
      
      #-- Filtro de PRODUCTOS
  		unless @producto_id.blank? and not abort_search
        lessons = Lesson.find(:all,:select => "lesson_products.*, lessons.*", 
  			:from => "lessons, lesson_products, productos",
        :conditions => ["lesson_products.lesson_id = lessons.id AND lesson_products.producto_id = productos.id AND productos.id IN (#{@producto_id.join(",")}) #{where_id_in}"]).map {|x| x.id}

        (lessons.empty?) ? abort_search = true : where_id_in = " AND lessons.id IN (#{lessons.join(",")})"
      end      

      #-- Filtro de RESULTADOS
  		unless @resultado_id.blank? and not abort_search
        lessons = Lesson.find(:all,:select => "lesson_results.*, lessons.*", 
  			:from => "lessons, lesson_results, resultados",
        :conditions => ["lesson_results.lesson_id = lessons.id AND lesson_results.resultado_id = resultados.id AND resultados.id IN (#{@resultado_id.join(",")}) #{where_id_in}"]).map {|x| x.id}

        (lessons.empty?) ? abort_search = true : where_id_in = " AND lessons.id IN (#{lessons.join(",")})"
      end
            
      #-- Paso final... el search de texto...      
      if abort_search
        @lessons=[]
      else
        filter_private = "AND isprivate=FALSE"
        if current_user
            unless current_user.ispublic:
              filter_private = ""
            end
        end  
        
  		  unless @q.blank?
  		    @lessons = Lesson.find(:all,:conditions=>["aprobada=TRUE #{filter_private} #{where_id_in} AND (name like ? or description like ?)","%#{@q}%","%#{@q}%"])
  		  else  
          @lessons = Lesson.find(:all,:conditions=>"aprobada=TRUE #{filter_private} #{where_id_in}")
        end                                                                                        
      end
      

      #-- Respond para pasar el EXPORT CSV o el HTML
      respond_to do |format|
        format.html 
        format.csv do
          print @lessons.length
          c=render(:file=>"lessons/index.csv.erb", :layout => false, :locals => {:lessons=>@lessons})
          send_data(c, :type => 'text/csv;utf-8;')
        end
      end
    end
  end
  
end
