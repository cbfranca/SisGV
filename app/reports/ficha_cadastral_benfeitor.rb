#encoding: utf-8

class FichaCadastralBenfeitor < Prawn::Document

  def initialize()
    super() 
  end

  def logo
    logopath =  "#{Rails.root}/app/assets/images/SantasMissoesPopulares.jpg"
    image logopath, :width => 100, :height => 90
    move_down 10    
  end

  def to_pdf(benfeitor)
  
  	@benfeitor = benfeitor

    logo

    linhaPath =  "#{Rails.root}/app/assets/images/linha.jpg"
    image linhaPath
       
    move_down 40
    fill_color "40464e"
    text "Ficha cadastral de benfeitor", :size => 18, :style => :bold, :align => :center
    
    move_down 30
    text "Nome: #{@benfeitor.nome}", :inline_format => true

    move_down 15
    text "Nascimento: #{@benfeitor.nascimento.strftime("%d/%m/%Y")  }", :inline_format => true

    move_down 15

    if !@benfeitor.cidade_id.nil?      
      cidade = Cidade.find(@benfeitor.cidade_id).nome
    end

    if !@benfeitor.cod_estado.nil?      
      estado = Estado.find(@benfeitor.cod_estado).nome
    end


    text "Endereço: #{@benfeitor.endereco} , #{@benfeitor.bairro}, #{cidade} , #{estado} " , :inline_format => true    

    move_down 15
    text "CEP: #{@benfeitor.cep}", :inline_format => true

    if !@benfeitor.complemento_endereco.empty?
        move_down 15
        text "Complemento: #{@benfeitor.complemento_endereco}", :inline_format => true
    end   

    move_down 15
    text "Telefone residencial: #{@benfeitor.telefone_residencial}", :inline_format => true

    move_down 15
    text "Celular: #{@benfeitor.celular}", :inline_format => true

    move_down 15
    text "E-mail: #{@benfeitor.email}", :inline_format => true

    if !@benfeitor.primeiro_contato.nil?
      move_down 15
      text "Primeiro contato: #{@benfeitor.primeiro_contato.strftime("%d/%m/%Y")}", :inline_format => true
    else
      move_down 15
      text "Primeiro contato: Ainda não foi feito nenhum contato. ", :inline_format => true
    end

    render
  end
end