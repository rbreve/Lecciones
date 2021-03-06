class ProductiveSectorsController < ApplicationController
  def index
    @productive_sectors = ProductiveSector.all
  end
  
  def show
    @productive_sector = ProductiveSector.find(params[:id])
  end
  
  def new
    @productive_sector = ProductiveSector.new
  end
  
  def create
    @productive_sector = ProductiveSector.new(params[:productive_sector])
    if @productive_sector.save
      flash[:notice] = "Sector productivo creado con éxito"
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end
  
  def edit
    @productive_sector = ProductiveSector.find(params[:id])
  end
  
  def update
    @productive_sector = ProductiveSector.find(params[:id])
    if @productive_sector.update_attributes(params[:productive_sector])
      flash[:notice] = "Sector productivo actualizado con éxito"
      redirect_to @productive_sector
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @productive_sector = ProductiveSector.find(params[:id])
    @productive_sector.destroy
    flash[:notice] = "Sector productivo eliminado"
    redirect_to productive_sectors_url
  end
end
