#encoding: utf-8

class Vocacionado < ActiveRecord::Base
  attr_accessible :ativo, :bairro, :celular, :cep, :cidade, :cod_escolaridade, :cod_estado, :complemento_endereco, :email, :endereco, :nascimento, :nome, :primeiro_contato, :telefone_residencial

  validates_presence_of :nome , :message => "inválido. Favor preencher corretamente." 
  
  validates :email,  			
  			:uniqueness => true
  			
end
