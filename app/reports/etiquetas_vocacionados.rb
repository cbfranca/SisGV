#encoding: utf-8
#require "prawn/labels"

class EtiquetasVocacionados < Prawn::Document
  def initialize()
    super() 
  end

  def to_pdf(vocacionado)
  
  	@vocacionados = vocacionado    

    @items = []
  

    #define a custom label type
    Prawn::Labels.types = {
      "PIMACO_6081" => {
        "paper_size"    => "LETTER",
        # "top_margin"    => 36,
        # "bottom_margin" => 36,
        # "left_margin"   => 11,
        # "right_margin"  => 11,
         "columns"       => 2,
         "rows"          => 10,
        # "column_gutter" => 10,
        # "row_gutter"    => 0        
    }}

    Prawn::Labels.render(@vocacionados, :type => "PIMACO_6081") do |pdf, voc|
      pdf.text voc.nome
      pdf.text voc.endereco
      pdf.text voc.bairro + "   " + voc.cidade_id + "   " + Estado.find(voc.cod_estado).nome + "   " +  voc.cep               
    end    
  end
end
