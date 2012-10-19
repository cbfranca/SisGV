#encoding: utf-8

class ListagemVocacionados < Prawn::Document
  def initialize(vocacionado)
    super(top_margin: 70)
    @vocacionados = vocacionado
    to_pdf(vocacionado)
  end

  def logo
    logopath =  "#{Rails.root}/app/assets/images/SantasMissoesPopulares.jpg"
    image logopath, :width => 100, :height => 90
    move_down 10    
  end

  def report_header    
    logo

    linhaPath =  "#{Rails.root}/app/assets/images/linha.jpg"
    image linhaPath       
    
    move_up 50
    fill_color "40464e"
    text "Listagem de Vocacionados", :size => 18, :style => :bold, :align => :center
    move_down 60
  end

  def line_items
      move_down 20
      table line_item_rows,
        :header => true, 
        :header_color => "CCCCCC",
        :border_widths => [0,0,0,0],
        #:border_style => :grid,
        :font_size => 11,        
        :position => :center,
        :column_widths => { 0 => 150, 1 => 100},
        :align => { 0 => :left, 1 => :center, 2 => :center},
        :row_colors => ["DDDDDD", "FFFFFF"]           
   end

   def line_item_rows
     [["Nome","Estado","Cidade"]] +
     @vocacionados.map do |vocacionado|
      [ 
        vocacionado.nome || "", 
        Estado.find(vocacionado.cod_estado ).nome ,
        vocacionado.cidade_id
      ]
      end
   end

    def to_pdf(vocacionado)    
      report_header
      line_items
    end
end
