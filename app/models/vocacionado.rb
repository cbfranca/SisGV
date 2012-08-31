#encoding: utf-8

class Vocacionado < ActiveRecord::Base
  attr_accessible :ativo, :bairro, :celular, :cep, :cidade_id, :cod_escolaridade, :cod_estado, :complemento_endereco, :email, :endereco, :nascimento, :nome, :primeiro_contato, :telefone_residencial

  #Relacionamentos
  belongs_to :estado
  belongs_to :cidade

  #Validações
  validates_presence_of :nome ,
  						:bairro, 
  						:cep, 
  						:cidade_id, 
  						:cod_estado, 
  						:endereco,
  						:nascimento,
  						:nome,
  						:message => "inválido. Favor preencher corretamente."     
  
  scope :with_name, lambda {|parameter| where("nome like ?", "%#{parameter}%")}     
  scope :with_birthday_month, lambda {|parameter| where("month(nascimento) = ?", parameter)}
  scope :with_neighborhood, lambda {|parameter| where("bairro = ?", parameter)}
  scope :vocacionado_cod_estado, lambda {|parameter| where("cod_estado = ?", parameter)}
  scope :vocacionado_cidade_id, lambda {|parameter| where("cidade_id = ?", parameter)}
  #scope :with_birthday, lambda {|parameter| where(" month(now()) = ?", "month(nascimento)") unless parameter = false }
  scope :with_active, lambda {|parameter| where(" ativo = ?", parameter)}

  def self.search(parameters)
    vocacionado_query = self.scoped
    parameters.each do |parameter, value|
      if not value.empty? and vocacionado_query.respond_to? parameter
       vocacionado_query = vocacionado_query.send(parameter, value) 
      end
    end
    vocacionado_query
  end  			
end
