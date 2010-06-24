class ConfirmController < Devise::ConfirmationsController 
	
	def show
		 self.resource = resource_class.confirm_by_token(params[:confirmation_token])

    if resource.errors.empty?
      set_flash_message :notice, :confirmed
			redirect_to @users
      #sign_in_and_redirect(resource_name, resource)
    else
      render_with_scope :new
    end
  end
   

end