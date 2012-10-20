#encoding: utf-8

#require "prawn/labels"

class EtiquetasBenfeitores < Prawn::Document
  def initialize()
    super() 
  end

  def to_pdf(benfeitor)
  
  	@benfeitores = benfeitor

    @items = []

    Prawn::Labels.types = {
      "Etiquetas" => {
        "paper_size"    => "A4",
        "top_margin"    => 12.07,
        "bottom_margin" => 0,
        "left_margin"   => 6.000,
        "right_margin"  => 6.000,
        "columns"       => 2,
        "rows"          => 8,
        "column_gutter" => 7.087,
        "row_gutter"    => 0

    }}
    
    @benfeitores.each do |item|
      @items << item
    end

    Prawn::Labels.render(@items, :type => "Etiquetas") do |pdf, benf|
      pdf.text benf.nome
      pdf.text benf.endereco
      pdf.text benf.bairro
      pdf.text benf.cidade_id  + "   " + Estado.find(benf.cod_estado).nome + "   " +  benf.cep      
    end    
  end
end
