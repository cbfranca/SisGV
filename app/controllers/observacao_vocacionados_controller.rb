class ObservacaoVocacionadosController < ApplicationController
  # GET /observacao_vocacionados
  # GET /observacao_vocacionados.json

  def index   
    if params[:vocacionado]
      @observacao_vocacionados = ObservacaoVocacionado.search(params).where("vocacionado_id = #{params[:vocacionado]}")
                                                                     .paginate(:per_page => 5, :page => params[:page])    
    else
      @observacao_vocacionados = ObservacaoVocacionado.search(params).paginate(:per_page => 5, :page => params[:page])                                                                         
    end 
  end


  # GET /observacao_vocacionados/1
  # GET /observacao_vocacionados/1.json
  def show
    @observacao_vocacionado = ObservacaoVocacionado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @observacao_vocacionado }
    end
  end

  # GET /observacao_vocacionados/new
  # GET /observacao_vocacionados/new.json
  def new
    @observacao_vocacionado = ObservacaoVocacionado.new

    if params[:vocacionado]
      @observacao_vocacionado.vocacionado_id = params[:vocacionado]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @observacao_vocacionado }
    end
  end

  # GET /observacao_vocacionados/1/edit
  def edit
    @observacao_vocacionado = ObservacaoVocacionado.find(params[:id])
  end

  # POST /observacao_vocacionados
  # POST /observacao_vocacionados.json
  def create
    @observacao_vocacionado = ObservacaoVocacionado.new(params[:observacao_vocacionado])

    respond_to do |format|
      if @observacao_vocacionado.save
        format.html { redirect_to @observacao_vocacionado, notice: 'Observacao vocacionado was successfully created.' }
        format.json { render json: @observacao_vocacionado, status: :created, location: @observacao_vocacionado }
      else
        format.html { render action: "new" }
        format.json { render json: @observacao_vocacionado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /observacao_vocacionados/1
  # PUT /observacao_vocacionados/1.json
  def update
    @observacao_vocacionado = ObservacaoVocacionado.find(params[:id])

    respond_to do |format|
      if @observacao_vocacionado.update_attributes(params[:observacao_vocacionado])
        format.html { redirect_to @observacao_vocacionado, notice: 'Observacao vocacionado was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @observacao_vocacionado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /observacao_vocacionados/1
  # DELETE /observacao_vocacionados/1.json
  def destroy
    @observacao_vocacionado = ObservacaoVocacionado.find(params[:id])
    @observacao_vocacionado.destroy

    respond_to do |format|
      format.html { redirect_to :action => :index , :vocacionado => @observacao_vocacionado.vocacionado_id }
      format.json { head :no_content }
    end
  end
end
