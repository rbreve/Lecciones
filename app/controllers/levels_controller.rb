class LevelsController < ApplicationController
  def index
    @levels = Level.all
  end
  
  def show
    @level = Level.find(params[:id])
  end
  
  def new
    @level = Level.new
  end
  
  def create
    @level = Level.new(params[:level])
    if @level.save
      flash[:notice] = "Successfully created level."
      redirect_to @level
    else
      render :action => 'new'
    end
  end
  
  def edit
    @level = Level.find(params[:id])
  end
  
  def update
    @level = Level.find(params[:id])
    if @level.update_attributes(params[:level])
      flash[:notice] = "Successfully updated level."
      redirect_to @level
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @level = Level.find(params[:id])
    @level.destroy
    flash[:notice] = "Successfully destroyed level."
    redirect_to levels_url
  end
end
