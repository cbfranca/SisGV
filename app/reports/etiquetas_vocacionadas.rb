#encoding: utf-8

#require "prawn/labels"

class EtiquetasVocacionadas < Prawn::Document
  def initialize()
    super() 
  end

  def to_pdf(vocacionada)
  
  	@vocacionadas = vocacionada

    @items = []
    
    @vocacionadas.each do |item|
      @items << item
    end

    Prawn::Labels.types = 'config/pimaco_labels.yml' 

    Prawn::Labels.render(@items, :type => "pimaco_6081") do |pdf, voc|
      pdf.text voc.nome, :size => 10
      pdf.text voc.endereco[0..50], :size => 10
      pdf.text voc.bairro + "  " + voc.cidade_id  + "   " + Estado.find(voc.cod_estado).nome + "   " +  voc.cep      , :size => 10
      
    end    
  end
end
