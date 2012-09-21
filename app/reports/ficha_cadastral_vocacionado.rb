#encoding: utf-8

class FichaCadastralVocacionado < Prawn::Document

  def initialize()
    super() 
  end

  def logo
    logopath =  "#{Rails.root}/app/assets/images/SantasMissoesPopulares.jpg"
    image logopath, :width => 100, :height => 90
    move_down 10    
  end

  def to_pdf(vocacionado)
  
  	@vocacionado = vocacionado

    logo

    linhaPath =  "#{Rails.root}/app/assets/images/linha.jpg"
    image linhaPath
       
    move_down 40
    fill_color "40464e"
    text "Fica cadastral de Vocacionado", :size => 18, :style => :bold, :align => :center
    
    move_down 30
    text "Nome: #{@vocacionado.nome}", :inline_format => true

    move_down 15
    text "Nascimento: #{@vocacionado.nascimento}", :inline_format => true

    move_down 15
    text "Escolaridade: #{@vocacionado.escolaridade}", :inline_format => true

    move_down 15
    text "Endereço: #{@vocacionado.endereco}", :inline_format => true

    move_down 15
    text "Bairro: #{@vocacionado.bairro}", :inline_format => true

    move_down 15
    text "CEP: #{@vocacionado.cep}", :inline_format => true

    move_down 15
    text "Complemento: #{@vocacionado.complemento_endereco}", :inline_format => true

    move_down 15
    text "Estado: #{Estado.find(@vocacionado.cod_estado).nome}", :inline_format => true

    move_down 15
    text "Cidade: #{Cidade.find(@vocacionado.cidade_id).nome}", :inline_format => true

    move_down 15
    text "Telefone residencial: #{@vocacionado.telefone_residencial}", :inline_format => true

    move_down 15
    text "Celular: #{@vocacionado.celular}", :inline_format => true

    move_down 15
    text "E-mail: #{@vocacionado.email}", :inline_format => true

    move_down 15
    text "Primeiro contato: #{@vocacionado.primeiro_contato}", :inline_format => true

    render
  end
end