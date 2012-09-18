module ApplicationHelper
  def flash_message
    messages = ""
    [:notice, :info, :warning, :error].each {|type|
      if flash[type]        
        messages += "<p class=\"#{type}\">" + html_escape(flash[type]) +"</p>"
      end
    }    
    messages.html_safe
  end
end