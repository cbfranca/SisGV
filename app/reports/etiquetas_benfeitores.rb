#encoding: utf-8

#require "prawn/labels"

class EtiquetasBenfeitores < Prawn::Document
  def initialize()
    super() 
  end

  def to_pdf(benfeitor)
  
  	@benfeitores = benfeitor

    @items = []

  #define a custom label type
    Prawn::Labels.types = {
      "Etiquetas" => {
        "paper_size"    => "LETTER",
        "top_margin"    => 36,
        "bottom_margin" => 36,
        "left_margin"   => 11,
        "right_margin"  => 11,
        "columns"       => 2,
        "rows"          => 10,
        "column_gutter" => 10,
        "row_gutter"    => 0        
    }}
        
    @benfeitores.each do |item|
      @items << item
    end

    Prawn::Labels.render(@items, :type => "Etiquetas") do |pdf, benf|
      pdf.text benf.nome
      pdf.text benf.endereco
      pdf.text benf.bairro + "  " + benf.cidade_id  + "   " + Estado.find(benf.cod_estado).nome + "   " +  benf.cep      
    end    
  end
end
