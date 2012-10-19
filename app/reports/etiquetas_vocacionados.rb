#encoding: utf-8

#require "prawn/labels"


class EtiquetasVocacionados < Prawn::Document
  def initialize()
    super() 
  end

  def to_pdf(vocacionado)
  
  	@vocacionados = vocacionado    

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
    
    @vocacionados.each do |item|
      @items << item
    end

    Prawn::Labels.render(@items, :type => "Etiquetas") do |pdf, voc|
      pdf.text voc.nome
      pdf.text voc.endereco
      pdf.text voc.bairro
      pdf.text voc.cidade_id + "   " + Estado.find(voc.cod_estado).nome + "   " +  voc.cep      
    end    
  end
end
