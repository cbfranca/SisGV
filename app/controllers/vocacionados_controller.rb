class VocacionadosController < ApplicationController
  # GET /vocacionados
  # GET /vocacionados.json
  def index
    @vocacionados = Vocacionado.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vocacionados }
    end
  end

  # GET /vocacionados/1
  # GET /vocacionados/1.json
  def show
    @vocacionado = Vocacionado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vocacionado }
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
        format.html { redirect_to @vocacionado, notice: 'Vocacionado was successfully created.' }
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
        format.html { redirect_to @vocacionado, notice: 'Vocacionado was successfully updated.' }
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
