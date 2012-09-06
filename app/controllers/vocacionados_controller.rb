class VocacionadosController < ApplicationController
  # GET /vocacionados
  # GET /vocacionados.json


  def index
    session[:filtro_busca] = nil
    @vocacionado = Vocacionado.search(params).paginate(:per_page => 2, :page => params[:page])
    session[:filtro_busca] = @vocacionado
  end


def generate_registration_form
  @vocacionado = Vocacionado.find(params[:id])

    output = FichaCadastralVocacionado.new.to_pdf(@vocacionado)

    respond_to do |format|
   
      format.pdf do         
        send_data output, :filename => "vocacionado_#{@vocacionado.created_at.strftime("%d/%m/%Y")}.pdf",
                          :type => "application/pdf",
                          :disposition => "inline"
      end
    end  
end
  
  # GET /vocacionados/1.pdf
  def show
    @vocacionado = session[:filtro_busca]

    output = ListagemVocacionados.new.to_pdf(@vocacionado)

    respond_to do |format|
   
      format.pdf do         
        send_data output, :filename => "listagem_vocacionados#{DateTime.now}.pdf",
                          :type => "application/pdf"        
      end
    end
  end

  # GET /vocacionados/new
  # GET /vocacionados/new.json
  def new
    @vocacionado = Vocacionado.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vocacionado }
    end
  end

  # GET /vocacionados/1/edit
  def edit
    @vocacionado = Vocacionado.find(params[:id])
  end

  # POST /vocacionados
  # POST /vocacionados.json
  def create
    @vocacionado = Vocacionado.new(params[:vocacionado])

    respond_to do |format|
      if @vocacionado.save
        format.html { redirect_to vocacionados_url, notice: 'Vocacionado was successfully created.' }
        format.json { render json: @vocacionado, status: :created, location: @vocacionado }
      else
        format.html { render action: "new" }
        format.json { render json: @vocacionado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vocacionados/1
  # PUT /vocacionados/1.json
  def update
    @vocacionado = Vocacionado.find(params[:id])

    respond_to do |format|
      if @vocacionado.update_attributes(params[:vocacionado])
        format.html { redirect_to vocacionados_url, notice: 'Vocacionado was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vocacionado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vocacionados/1
  # DELETE /vocacionados/1.json
  def destroy
    @vocacionado = Vocacionado.find(params[:id])
    @vocacionado.destroy

    respond_to do |format|
      format.html { redirect_to vocacionados_url }
      format.json { head :no_content }
    end
  end
end
