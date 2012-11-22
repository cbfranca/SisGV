#encoding: utf-8

class Vocacionada < ActiveRecord::Base
  attr_accessible :ativo, :bairro, :celular, :cep, :cidade_id, :escolaridade, :cod_estado, :complemento_endereco, :email, :endereco, :nascimento, :nome, :primeiro_contato, :telefone_residencial

  #Relacionamentos
  belongs_to :estado
  belongs_to :cidade
  has_many :observacao_vocacionadas

  #Validações
  validates_presence_of :nome ,  						 						
  						:message => "inválido. Favor preencher corretamente."


  def self.search(params)
     vocacionadas = Vocacionada.order(:nome)
     vocacionadas = vocacionadas.where("nome like ?", "%#{params[:with_name]}%") if params[:with_name].present?
     vocacionadas = vocacionadas.where("bairro like ?", "%#{params[:with_neighborhood]}%") if params[:with_neighborhood].present?
     vocacionadas = vocacionadas.where("cod_estado = ?", "#{params[:vocacionada_cod_estado]}") if params[:vocacionada_cod_estado].present?
     vocacionadas = vocacionadas.where("month(nascimento) = ?", "#{params[:with_birthday_month]}") if params[:with_birthday_month].present?
     vocacionadas = vocacionadas.where("cidade_id like ?", "%#{params[:vocacionada_cidade_id]}%") if params[:vocacionada_cidade_id].present?
     vocacionadas = vocacionadas.where("month(now()) =  month(nascimento)") if params[:with_birthday]
     vocacionadas = vocacionadas.where("ativo <> ?", "#{params[:with_dead_file]}") if params[:with_dead_file]

     if params[:with_dead_file].blank?
        vocacionadas = vocacionadas.where("ativo = 1")
     else
        vocacionadas = vocacionadas.where("ativo <> ?", "#{params[:with_dead_file]}")
     end

     vocacionadas
  end

end
