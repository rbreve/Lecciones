class LcountriesController < ApplicationController
  def index
    @lcountries = Lcountry.all
  end
  
  def show
    @lcountry = Lcountry.find(params[:id])
  end
  
  def new
    @lcountry = Lcountry.new
  end
  
  def create
    @lcountry = Lcountry.new(params[:lcountry])
    if @lcountry.save
      flash[:notice] = "Successfully created lcountry."
      redirect_to @lcountry
    else
      render :action => 'new'
    end
  end
  
  def edit
    @lcountry = Lcountry.find(params[:id])
  end
  
  def update
    @lcountry = Lcountry.find(params[:id])
    if @lcountry.update_attributes(params[:lcountry])
      flash[:notice] = "Successfully updated lcountry."
      redirect_to @lcountry
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @lcountry = Lcountry.find(params[:id])
    @lcountry.destroy
    flash[:notice] = "Successfully destroyed lcountry."
    redirect_to lcountries_url
  end
end
