class IfisController < ApplicationController
  before_filter :authenticate_admin!, :only => [:edit, :update, :create, :new]
  
  def index
    @ifis = Ifi.all
    @countries = Lcountry.find(:all)
    @sectores = ProductiveSector.find(:all)
    
    psector_id=params[:psector_id]
    country_id=params[:country_id]


    unless psector_id.blank?
			@ifis=@ifis.by_psector(psector_id)
		end
    
    if country_id.to_s != ""
      @ifis=@ifis.by_country(country_id)
    end
    @ifis=@ifis.paginate :page => params[:page]
  end
  
  def show
    @ifi = Ifi.find(params[:id])
    if current_user.ispublic:
      @lessons = @ifi.lessons.approved.external
    else
      @lessons = @ifi.lessons.approved
    end
  
  @lessons_counter = @lessons.length
  
  end
  
  def new
    @ifi = Ifi.new
  end
  
  def create
    @ifi = Ifi.new(params[:ifi])
    if @ifi.save
      flash[:notice] = "IFI creada con éxito"
      redirect_to @ifi
    else
      render :action => 'new'
    end
  end
  
  def edit
    @ifi = Ifi.find(params[:id])
  end
  
  def update
    params[:ifi][:productive_sector_ids] ||= []
    @ifi = Ifi.find(params[:id])
    
    if @ifi.update_attributes(params[:ifi])
      flash[:notice] = "IFI actualizada con éxito"
      redirect_to @ifi
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @ifi = Ifi.find(params[:id])
    # @ifi.destroy
    @ifi.deleted=true
    @ifi.save
    flash[:notice] = "IFI desactivada"
    redirect_to ifis_url
  end
end
