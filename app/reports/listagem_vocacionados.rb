#encoding: utf-8

class ListagemVocacionados < Prawn::Document
  def initialize()
    super() 
  end

  def to_pdf(vocacionado)
  
  	@vocacionados = vocacionado

  	items = [["Nome","Estado","Cidade"]]
  	items += @vocacionados.map do |vocacionado|
  	[  		
  		vocacionado.nome,
  		Estado.find(vocacionado.cod_estado).nome,
  		Cidade.find(vocacionado.cidade_id).nome	   
  	]
  	end  	

  	table items, :header => true ,:row_colors => ["FFFFFF","DDDDDD"]
  				
  				

    render
  end
end
