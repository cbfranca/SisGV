#encoding: utf-8

#require "prawn/labels"

class EtiquetasBenfeitores < Prawn::Document
  def initialize()
    super() 
  end

  def to_pdf(benfeitor)
  
  	@benfeitores = benfeitor

    @items = []
  
  Prawn::Labels.types = 'config/pimaco_labels.yml'        

  #Prawn::Labels.types = File.join(File.expand_path("config/pimaco_labels.yml"))


    @benfeitores.each do |item|
      @items << item
    end

    Prawn::Labels.render(@items, :type => "pimaco_6081") do |pdf, benf|
      pdf.text benf.nome
      pdf.text benf.endereco
      pdf.text benf.bairro + "  " + benf.cidade_id  + "   " + Estado.find(benf.cod_estado).nome + "   " +  benf.cep      
    end    
  end
end
