#encoding: utf-8

class Vocacionado < ActiveRecord::Base
  attr_accessible :ativo, :bairro, :celular, :cep, :cidade_id, :escolaridade, :cod_estado, :complemento_endereco, :email, :endereco, :nascimento, :nome, :primeiro_contato, :telefone_residencial

  #Relacionamentos
  belongs_to :estado
  belongs_to :cidade
  has_many :observacao_vocacionados
  

  #Validações
  validates_presence_of :nome ,  						 						
  						:message => "inválido. Favor preencher corretamente."     
  
  scope :with_name, lambda {|parameter| where("nome like ?", "%#{parameter}%")}     
  scope :with_birthday_month, lambda {|parameter| where("month(nascimento) = ?", parameter)}
  scope :with_neighborhood, lambda {|parameter| where("bairro = ?", parameter)}
  scope :vocacionado_cod_estado, lambda {|parameter| where("cod_estado = ?", parameter)}
  scope :vocacionado_cidade_id, lambda {|parameter| where("cidade_id like ?", "%#{parameter}%")}       
  scope :with_birthday, lambda {|parameter| where(" month(now()) =  month(nascimento)") if parameter.present? }
  scope :with_dead_file, lambda {|parameter| where(" ativo = ?", 0) if parameter.present? }

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
