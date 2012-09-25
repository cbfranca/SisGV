#encoding: utf-8

class ObservacaoVocacionada < ActiveRecord::Base
    attr_accessible :descricao, :vocacionada_id, :data

   #Validações
   validates_presence_of :descricao ,
  						:data,
  						:message => "inválido. Favor preencher corretamente."    
  	validates :vocacionada_id, :presence => true

   #Relacionamentos
   belongs_to :vocacionada

   scope :with_date, lambda {|parameter| where("date_format(data,'%d/%m/%Y') = ?", parameter)}
   scope :vocacionado_id, lambda {|parameter| where("vocacionada_id = ?", parameter)}

   def self.search(parameters)
     observacao_vocacionada_query = self.scoped
     parameters.each do |parameter, value|
       if not value.empty? and observacao_vocacionada_query.respond_to? parameter
        observacao_vocacionada_query = observacao_vocacionada_query.send(parameter, value) 
       end
     end
     observacao_vocacionada_query
   end  
end
