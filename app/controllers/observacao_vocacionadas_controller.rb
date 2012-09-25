# -*- coding: utf-8 -*-

class ObservacaoVocacionadasController < ApplicationController
  # GET /observacao_vocacionadas
  # GET /observacao_vocacionadas.json
  def index   
    if params[:vocacionada]
      @observacao_vocacionadas = ObservacaoVocacionada.search(params).where("vocacionada_id = #{params[:vocacionada]}")
                                                                     .paginate(:per_page => 5, :page => params[:page])    
    else
      @observacao_vocacionadas = ObservacaoVocacionada.search(params).paginate(:per_page => 5, :page => params[:page])                                                                         
    end 
  end

  # GET /observacao_vocacionadas/1
  # GET /observacao_vocacionadas/1.json
  def show
    @observacao_vocacionada = ObservacaoVocacionada.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @observacao_vocacionada }
    end
  end

  # GET /observacao_vocacionadas/new
  # GET /observacao_vocacionadas/new.json
  def new
    @observacao_vocacionada = ObservacaoVocacionada.new

    if params[:vocacionada]
      @observacao_vocacionada.vocacionada_id = params[:vocacionada]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @observacao_vocacionada }
    end
  end

  # GET /observacao_vocacionadas/1/edit
  def edit
    @observacao_vocacionada = ObservacaoVocacionada.find(params[:id])
  end

  # POST /observacao_vocacionadas
  # POST /observacao_vocacionadas.json
  def create
    @observacao_vocacionada = ObservacaoVocacionada.new(params[:observacao_vocacionada])

    respond_to do |format|
      if @observacao_vocacionada.save
         format.html { redirect_to :action => :index, :vocacionada => @observacao_vocacionada.vocacionada_id }        
         flash[:notice] = "Registro criado com sucesso!"
      else
        format.html { render action: "new" }
        flash[:warning] = "Os campos com * são obrigatórios, preencha-os corretamente."
      end
    end
  end

  # PUT /observacao_vocacionadas/1
  # PUT /observacao_vocacionadas/1.json
  def update
    @observacao_vocacionada = ObservacaoVocacionada.find(params[:id])

    respond_to do |format|
      if @observacao_vocacionada.update_attributes(params[:observacao_vocacionada])
        format.html { redirect_to @observacao_vocacionada}
        flash[:notice] = "Registro alterado com sucesso!"
      else
        format.html { render action: "edit" }
        format.json { render json: @observacao_vocacionada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /observacao_vocacionadas/1
  # DELETE /observacao_vocacionadas/1.json
  def destroy
    @observacao_vocacionada = ObservacaoVocacionada.find(params[:id])
    @observacao_vocacionada.destroy

    respond_to do |format|
      format.html { redirect_to observacao_vocacionadas_url }
      format.json { head :no_content }
    end
  end
end
