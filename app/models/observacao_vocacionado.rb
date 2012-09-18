#encoding: utf-8

class ObservacaoVocacionado < ActiveRecord::Base
   attr_accessible :descricao, :vocacionado_id, :data


   #Validações
   validates_presence_of :descricao ,
  						:data,
  						:message => "inválido. Favor preencher corretamente."    
  	validates :vocacionado_id, :presence => true

   #Relacionamentos
   belongs_to :vocacionado

   scope :with_date, lambda {|parameter| where("date_format(data,'%d/%m/%Y') = ?", parameter)}


   def self.search(parameters)
     observacao_vocacionado_query = self.scoped
     parameters.each do |parameter, value|
       if not value.empty? and observacao_vocacionado_query.respond_to? parameter
        observacao_vocacionado_query = observacao_vocacionado_query.send(parameter, value) 
       end
     end
     observacao_vocacionado_query
   end  			

end
