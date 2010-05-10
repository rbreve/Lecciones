class LeccionTypesController < ApplicationController
  def index
    @leccion_types = LeccionType.all
  end
  
  def show
    @leccion_type = LeccionType.find(params[:id])
  end
  
  def new
    @leccion_type = LeccionType.new
  end
  
  def create
    @leccion_type = LeccionType.new(params[:leccion_type])
    if @leccion_type.save
      flash[:notice] = "Successfully created leccion type."
      redirect_to @leccion_type
    else
      render :action => 'new'
    end
  end
  
  def edit
    @leccion_type = LeccionType.find(params[:id])
  end
  
  def update
    @leccion_type = LeccionType.find(params[:id])
    if @leccion_type.update_attributes(params[:leccion_type])
      flash[:notice] = "Successfully updated leccion type."
      redirect_to @leccion_type
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @leccion_type = LeccionType.find(params[:id])
    @leccion_type.destroy
    flash[:notice] = "Successfully destroyed leccion type."
    redirect_to leccion_types_url
  end
end
