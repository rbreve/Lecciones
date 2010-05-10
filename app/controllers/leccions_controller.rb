class LeccionsController < ApplicationController
  def index
    @leccions = Leccion.all
  end
  
  def show
    @leccion = Leccion.find(params[:id])
  end
  
  def new
    @leccion = Leccion.new
  end
  
  def create
    @leccion = Leccion.new(params[:leccion])
    if @leccion.save
      flash[:notice] = "Successfully created leccion."
      redirect_to @leccion
    else
      render :action => 'new'
    end
  end
  
  def edit
    @leccion = Leccion.find(params[:id])
  end
  
  def update
    @leccion = Leccion.find(params[:id])
    if @leccion.update_attributes(params[:leccion])
      flash[:notice] = "Successfully updated leccion."
      redirect_to @leccion
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @leccion = Leccion.find(params[:id])
    @leccion.destroy
    flash[:notice] = "Successfully destroyed leccion."
    redirect_to leccions_url
  end
end
