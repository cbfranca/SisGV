#encoding: utf-8

class Benfeitor < ActiveRecord::Base
  attr_accessible :ativo, :bairro, :celular, :cep, :cidade_id, :cod_estado, :complemento_endereco, :email, :endereco, :nascimento, :nome, :primeiro_contato, :telefone_residencial

  #Relacionamentos
  belongs_to :estado
  belongs_to :cidade
  has_many :doacoes

  #Validações
  validates_presence_of :nome ,                        
  						:message => "inválido. Favor preencher corretamente."   


  def self.search(params)
     benfeitores = Benfeitor.order(:nome)
     benfeitores = benfeitores.where("nome like ?", "%#{params[:with_name]}%") if params[:with_name].present?
     benfeitores = benfeitores.where("bairro like ?", "%#{params[:with_neighborhood]}%") if params[:with_neighborhood].present?
     benfeitores = benfeitores.where("cod_estado = ?", "#{params[:benfeitor_cod_estado]}") if params[:benfeitor_cod_estado].present?
     benfeitores = benfeitores.where("month(nascimento) = ?", "#{params[:with_birthday_month]}") if params[:with_birthday_month].present?
     benfeitores = benfeitores.where("cidade_id like ?", "%#{params[:benfeitor_cidade_id]}%") if params[:benfeitor_cidade_id].present?
     benfeitores = benfeitores.where("month(now()) =  month(nascimento)") if params[:with_birthday]
     
     if params[:with_dead_file].blank?
        benfeitores = benfeitores.where("ativo = 1")
     else
        benfeitores = benfeitores.where("ativo <> ?", "#{params[:with_dead_file]}") 
     end
     
     benfeitores
  end

end
