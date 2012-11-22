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

  def self.search(params)
     vocacionados = Vocacionado.order(:nome)
     vocacionados = vocacionados.where("nome like ?", "%#{params[:with_name]}%") if params[:with_name].present?
     vocacionados = vocacionados.where("bairro like ?", "%#{params[:with_neighborhood]}%") if params[:with_neighborhood].present?
     vocacionados = vocacionados.where("cod_estado = ?", "#{params[:vocacionado_cod_estado]}") if params[:vocacionado_cod_estado].present?
     vocacionados = vocacionados.where("month(nascimento) = ?", "#{params[:with_birthday_month]}") if params[:with_birthday_month].present?
     vocacionados = vocacionados.where("cidade_id like ?", "%#{params[:vocacionado_cidade_id]}%") if params[:vocacionado_cidade_id].present?
     vocacionados = vocacionados.where("month(now()) =  month(nascimento)") if params[:with_birthday]
     
     if params[:with_dead_file].blank?
        vocacionados = vocacionados.where("ativo = 1")
     else
        vocacionados = vocacionados.where("ativo <> ?", "#{params[:with_dead_file]}")
     end
     vocacionados
  end

end
