# -*- coding: utf-8 -*-

class LoginController < ApplicationController
  
  skip_before_filter :authenticate, :only => [:login]

	def login
	   if request.post?
			@usuario_logado = Usuario.find_by_email_and_senha(params[:email], Digest::MD5.hexdigest(params[:senha]))
			if @usuario_logado
				session[:usuario_logado] = @usuario_logado.id
				if session[:return_to] && !session[:return_to].include?(url_for(:action => "login"))
					redirect_to session[:return_to]
					session[:return_to] = nil
				else
					redirect_to :controller => "vocacionados"
				end
			else
			  flash[:error] = "Falha ao efetuar o login. E-mail e/ou Senha inválido(s)."
			end
		end
	end

  def logout
  	session[:usuario_logado] = nil
  	redirect_to :controller => :login , :action => :login
  end
end
