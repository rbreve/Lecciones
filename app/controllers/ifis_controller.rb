class IfisController < ApplicationController
  before_filter :authenticate_admin!, :only => [:edit, :update, :create, :new]
  
  def index
    @ifis = Ifi.all
    @countries = Country.find(:all)
    @sectores = ProductiveSector.find(:all)
    
    psector_id=params[:psector_id]
    country_id=params[:country_id]


    if psector_id.to_s != ""
			@ifis=@ifis.by_psector(psector_id)
		end
    
    if country_id.to_s != ""
      @ifis=@ifis.by_country(country_id)
    end
    
  end
  
  def show
    @ifi = Ifi.find(params[:id])
    @lessons = @ifi.lessons
  end
  
  def new
    @ifi = Ifi.new
  end
  
  def create
    @ifi = Ifi.new(params[:ifi])
    if @ifi.save
      flash[:notice] = "Successfully created ifi."
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
      flash[:notice] = "Successfully updated ifi."
      redirect_to @ifi
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @ifi = Ifi.find(params[:id])
    # @ifi.destroy
    flash[:notice] = "Successfully destroyed ifi."
    redirect_to ifis_url
  end
end
