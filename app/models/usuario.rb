#encoding: utf-8

class Usuario < ActiveRecord::Base
  attr_accessible :email, :nome, :senha

  before_update :valida_senha

  #Validações
  validates_presence_of :nome ,  						
  						:email,  											
  						:message => "inválido. Favor preencher corretamente."   
  validates_presence_of :senha, :if => :password_is_empty?

  def password_is_empty?
    if self.senha.empty?
     false
    else
      true
    end
  end              

  def valida_senha
    if self.senha.empty?
      attributes.delete(:senha)
    else
      self.senha  = Digest::MD5.hexdigest(self.senha)
    end

  end

  
  scope :with_name, lambda {|parameter| where("nome like ?", "%#{parameter}%")}  

  def self.search(parameters)
    usuario_query = self.scoped
    parameters.each do |parameter, value|
      if not value.empty? and usuario_query.respond_to? parameter
       usuario_query = usuario_query.send(parameter, value) 
      end
    end
    usuario_query
  end
end
