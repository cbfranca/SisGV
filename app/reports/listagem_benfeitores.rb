#encoding: utf-8

class ListagemBenfeitores < Prawn::Document
  def initialize(benfeitor)
    super(top_margin: 70)
    @benfeitores = benfeitor
    to_pdf()
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
    text "Listagem de Benfeitores", :size => 18, :style => :bold, :align => :center
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
     @benfeitores.map do |benfeitor|
      [ 
        benfeitor.nome , 
        Estado.find(benfeitor.cod_estado ).nome ,
        benfeitor.cidade_id
      ]
      end
   end

    def to_pdf()    
      report_header
      line_items
    end
end