# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  #verifica si es usuario normal o admin
  def is_user()
    p=request.env['PATH_INFO']
     if p.index('user')
      return true
    end
  end
end
