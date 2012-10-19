#encoding: utf-8

class ListagemVocacionadas < Prawn::Document
  def initialize(vocacionada)
    super(top_margin: 70)
    @vocacionadas = vocacionada
    to_pdf(vocacionada)
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
    text "Listagem de Vocacionadas", :size => 18, :style => :bold, :align => :center
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
     @vocacionadas.map do |vocacionada|
      [ 
        vocacionada.nome , 
        Estado.find(vocacionada.cod_estado ).nome ,
        vocacionada.cidade_id
      ]
      end
   end

    def to_pdf(vocacionada)    
      report_header
      line_items
    end
end