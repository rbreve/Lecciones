class OriginsController < ApplicationController
  def index
    @origins = Origin.all
  end
  
  def show
    @origin = Origin.find(params[:id])
  end
  
  def new
    @origin = Origin.new
  end
  
  def create
    @origin = Origin.new(params[:origin])
    if @origin.save
      flash[:notice] = "Origen creado con éxito"
      redirect_to @origin
    else
      render :action => 'new'
    end
  end
  
  def edit
    @origin = Origin.find(params[:id])
  end
  
  def update
    @origin = Origin.find(params[:id])
    if @origin.update_attributes(params[:origin])
      flash[:notice] = "Origen actualizado con éxito"
      redirect_to @origin
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @origin = Origin.find(params[:id])
    @origin.destroy
    flash[:notice] = "Origen eliminado con éxito"
    redirect_to origins_url
  end
end
