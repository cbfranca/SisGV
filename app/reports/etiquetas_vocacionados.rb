#encoding: utf-8
#require "prawn/labels"

class EtiquetasVocacionados < Prawn::Document
  def initialize()
    super() 
  end

  def to_pdf(vocacionado)
  
  	@vocacionados = vocacionado    

    @items = []
  
  Prawn::Labels.types = 'config/pimaco_labels.yml'
  #Prawn::Labels.types = File.join(File.expand_path("config/pimaco_labels.yml"))

    Prawn::Labels.render(@vocacionados, :type => "pimaco_6081") do |pdf, voc|
      pdf.text voc.nome
      pdf.text voc.endereco
      pdf.text voc.bairro + "   " + voc.cidade_id + "   " + Estado.find(voc.cod_estado).nome + "   " +  voc.cep               
    end    
  end
end
