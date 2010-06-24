class UsersController < ApplicationController
before_filter :authenticate_admin! 

  def index
    @users = User.all(:order => "created_at DESC")
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created user."
      redirect_to @user
    else
      render :action => 'new'
    end
  end
  
  def edit
    @countries = Country.find(:all)
    @ifis = Ifi.find(:all)
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Usuario fue Editado"
      redirect_to users_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.locked_at = Time.now
		@user.save
    flash[:notice] = "Usuario Bloqueado."
    redirect_to users_url
  end
end
