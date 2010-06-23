class HelpsController < ApplicationController
  def index
    @helps = Help.all
  end
  
  def show
    @help = Help.find(params[:id])
  end
  
  def new
    @help = Help.new
  end
  
  def create
    @help = Help.new(params[:help])
    if @help.save
      flash[:notice] = "Successfully created help."
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
      flash[:notice] = "Successfully updated help."
      redirect_to @help
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @help = Help.find(params[:id])
    @help.destroy
    flash[:notice] = "Successfully destroyed help."
    redirect_to helps_url
  end
end
