# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  #verifica si es usuario normal o admin
  def is_user()
    p=request.env['PATH_INFO']
     if p.index('user')
      return true
    end
  end   
  
  #crea el link y divs para help...
  def help(help_code,width=400,link_element="Ayuda")
    result = "<div id=\"#{help_code}\" style=\"display:none;padding:10px;border:solid 1px #CCCCCC;width:#{width}px\"></div>"
    result << "<div id=\"#{help_code}-link\"><a href=# onclick=\"new Ajax.Updater('#{help_code}', '/helps/display/#{help_code}', {asynchronous:true, evalScripts:true, onLoading:function(request){Effect.Appear('#{help_code}',{ duration: 0.5 })}});Effect.Fade('#{help_code}-link', { duration: 0.5 });;return false;\">#{link_element}</a></div>"
    return result
  end
  
end
