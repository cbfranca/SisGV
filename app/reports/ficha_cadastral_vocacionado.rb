class FichaCadastralVocacionado < Prawn::Document

  def initialize()
    super() 
  end

  def to_pdf(vocacionado)
  
  	@vocacionado = vocacionado
    text "Vocacionado #{@vocacionado.nome}"

 	move_down 30
    text "Certificado", :size => 24, :align => :center, :style => :bold

    render
  end
end