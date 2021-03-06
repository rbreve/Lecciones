class HelpsController < ApplicationController
  def index
    @helps = Help.all
  end
  
  def show
		@help = Help.find(params[:id])
		 
		respond_to do |format|
			format.html #index.html.erb
			format.json {render :json => @help}
		end
  end
  
  def new
    @help = Help.new
  end
  
  def create
    @help = Help.new(params[:help])
    if @help.save
      flash[:notice] = "Texto de ayuda creado con éxito"
      redirect_to @help
    else
      render :action => 'new'
    end
  end
  
  def edit
    @help = Help.find(params[:id])
  end
  
  def update
    @help = Help.find(params[:id])
    if @help.update_attributes(params[:help])
      flash[:notice] = "Texto de ayuda actualizado con éxito"
      redirect_to @help
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @help = Help.find(params[:id])
    @help.destroy
    flash[:notice] = "Texto de ayuda eliminado"
    redirect_to helps_url
  end
  
 
end
