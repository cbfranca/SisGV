#encoding: utf-8

class Doacao < ActiveRecord::Base  
   attr_accessible :valor, :benfeitor_id, :data


   #Validações
   validates_presence_of :valor ,
  						:data,
  						:message => "inválido. Favor preencher corretamente."    
  	validates :benfeitor_id, :presence => true

   #Relacionamentos
   belongs_to :benfeitor

   scope :with_date, lambda {|parameter| where("date_format(data,'%d/%m/%Y') = ?", parameter)}
   scope :benfeitor_id, lambda {|parameter| where("benfeitor_id = ?", parameter)}

   def self.search(parameters)
     doacao_query = self.scoped
     parameters.each do |parameter, value|
       if not value.empty? and doacao_query.respond_to? parameter
        doacao_query = doacao_query.send(parameter, value) 
       end
     end
     doacao_query
   end  			
end
