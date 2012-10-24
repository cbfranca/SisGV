module ApplicationHelper
  def flash_message
    messages = ""
    [:notice, :info, :warning, :error,:error_delete].each {|type|
      if flash[type]        
        messages += "<p class=\"#{type}\">" + html_escape(flash[type]) +"</p>"
      end
    }    
    messages.html_safe
  end

  def session_user
	 @session_user ||= Usuario.find(:first, :conditions => ['id = ?', session[:usuario_logado]])
  end

end