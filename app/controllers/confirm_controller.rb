class ConfirmController < ApplicationController
before_filter :authenticate_admin! 

	def show
		user=User.find(params[:id])
		flash[:notice] = "Usuario ? activado!", user.name
		user.confirm!
		redirect_to users_path
  end
   

end