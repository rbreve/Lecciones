# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  #verifica si es usuario normal o admin
  def is_user()
    p=request.env['PATH_INFO']
     if p.index('user')
      return true
    end
  end   
  
	def is_admin_path()
   p=request.env['PATH_INFO']
     if p.index('admin')
      return true
    end
	end

	def helpBox(code)
		@code=code
		 
		@helper = Help.find(:first, :conditions=>["code=?",@code])
			
		if @helper==nil
			@helper = Help.new(:code=>"helpNotFound", :title=>"No Encontrado", :description=>"Ayuda no encontrada")
		end
		
		return render(:file=>"helps/helpbox", :layout => false, :locals => {:code=>@code, :helper=>@helper})
	end
	
	def twill_paginate(collection = nil, options = {})
    will_paginate collection, {:previous_label => t('constants.will_paginate.previous'), :next_label => t('constants.will_paginate.next')}.merge(options)
  end
  
end
