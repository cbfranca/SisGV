#encoding: utf-8

class FichaCadastralVocacionada < Prawn::Document

  def initialize()
    super() 
  end

  def logo
    logopath =  "#{Rails.root}/app/assets/images/SantasMissoesPopulares.jpg"
    image logopath, :width => 100, :height => 90
    move_down 10    
  end

  def to_pdf(vocacionada)
  
  	@vocacionada = vocacionada

    logo

    linhaPath =  "#{Rails.root}/app/assets/images/linha.jpg"
    image linhaPath
       
    move_down 40
    fill_color "40464e"
    text "Ficha cadastral de vocacionada", :size => 18, :style => :bold, :align => :center
    
    move_down 30
    text "Nome: #{@vocacionada.nome}", :inline_format => true

    move_down 15
    text "Nascimento: #{@vocacionada.nascimento.strftime("%d/%m/%Y")  }", :inline_format => true

    move_down 15
    text "Escolaridade: #{@vocacionada.escolaridade}", :inline_format => true

    move_down 15
    text "Endereço: #{@vocacionada.endereco} , #{@vocacionada.bairro}, #{Cidade.find(@vocacionada.cidade_id).nome} , #{Estado.find(@vocacionada.cod_estado).nome} " , :inline_format => true    

    move_down 15
    text "CEP: #{@vocacionada.cep}", :inline_format => true

    if !@vocacionada.complemento_endereco.empty?
        move_down 15
        text "Complemento: #{@vocacionada.complemento_endereco}", :inline_format => true
    end   

    move_down 15
    text "Telefone residencial: #{@vocacionada.telefone_residencial}", :inline_format => true

    move_down 15
    text "Celular: #{@vocacionada.celular}", :inline_format => true

    move_down 15
    text "E-mail: #{@vocacionada.email}", :inline_format => true

    if !@vocacionada.primeiro_contato.nil?
      move_down 15
      text "Primeiro contato: #{@vocacionada.primeiro_contato.strftime("%d/%m/%Y")}", :inline_format => true
    else
      move_down 15
      text "Primeiro contato: Ainda não foi feito nenhum contato. ", :inline_format => true
    end

    render
  end
end