#encoding: utf-8

class FichaCadastralVocacionado < Prawn::Document

  def initialize(vocacionado)
    super() 
    logo
    to_pdf(vocacionado)
  end

  def logo
    logopath =  "#{Rails.root}/app/assets/images/SantasMissoesPopulares.jpg"
    image logopath, :width => 100, :height => 90
    move_down 10    
  end

  def to_pdf(vocacionado)
  
  	@vocacionado = vocacionado    

    linhaPath =  "#{Rails.root}/app/assets/images/linha.jpg"
    image linhaPath
       
    move_down 40
    fill_color "40464e"
    text "Ficha cadastral de Vocacionado", :size => 18, :style => :bold, :align => :center
    
    move_down 30
    text "Nome: #{@vocacionado.nome}", :inline_format => true

    move_down 15
    
    if !@vocacionado.nascimento.nil?      
      text "Nascimento: #{@vocacionado.nascimento.strftime("%d/%m/%Y") || "" }", :inline_format => true
    else
      text "Nascimento:", :inline_format => true
    end

    move_down 15
    text "Escolaridade: #{@vocacionado.escolaridade}", :inline_format => true

    move_down 15    

    if !@vocacionado.cod_estado.nil?      
      estado = Estado.find(@vocacionado.cod_estado).nome
    end

    text "Endereço: #{@vocacionado.endereco} , #{@vocacionado.bairro}, #{@vocacionado.cidade_id} , #{estado} " , :inline_format => true    

    move_down 15
    text "CEP: #{@vocacionado.cep}", :inline_format => true

    if !@vocacionado.complemento_endereco.empty?
        move_down 15
        text "Complemento: #{@vocacionado.complemento_endereco}", :inline_format => true
    end   

    move_down 15
    text "Telefone residencial: #{@vocacionado.telefone_residencial}", :inline_format => true

    move_down 15
    text "Celular: #{@vocacionado.celular}", :inline_format => true

    move_down 15
    text "E-mail: #{@vocacionado.email}", :inline_format => true

    if !@vocacionado.primeiro_contato.nil?
      move_down 15
      text "Primeiro contato: #{@vocacionado.primeiro_contato.strftime("%d/%m/%Y")}", :inline_format => true
    else
      move_down 15
      text "Primeiro contato: Ainda não foi feito nenhum contato. ", :inline_format => true
    end
  end
end