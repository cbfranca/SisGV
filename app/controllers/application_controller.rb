class ApplicationController < ActionController::Base
#  protect_from_forgery

	before_filter :authenticate

	protected
	def authenticate
	  unless session[:usuario_logado]
	 	 redirect_to :controller => :login, :action => :login
		 false
	  end
	    true
	end
	
end
