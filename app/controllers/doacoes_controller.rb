# -*- coding: utf-8 -*-

class DoacoesController < ApplicationController
  # GET /doacoes
  # GET /doacoes.json
  def index    
    if params[:benfeitor]
      session[:filtro_doacao] = nil
      session[:filtro_doacao] = params[:benfeitor]
    end
    
    @doacoes = Doacao.search(params).where("benfeitor_id = #{session[:filtro_doacao]}")
                                                                     .paginate(:per_page => 5, :page => params[:page])             
  end

  # GET /doacoes/1
  # GET /doacoes/1.json
  def show
    @doacao = Doacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @doacao }
    end
  end

  # GET /doacoes/new
  # GET /doacoes/new.json
  def new
    @doacao = Doacao.new

    if params[:benfeitor]
      @doacao.benfeitor_id = params[:benfeitor]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @doacao }
    end
  end

  # GET /doacoes/1/edit
  def edit
    @doacao = Doacao.find(params[:id])
  end

  # POST /doacoes
  # POST /doacoes.json
    def create
    @doacao = Doacao.new(params[:doacao])

    respond_to do |format|
      if @doacao.save
        format.html { redirect_to :action => :index, :benfeitor => @doacao.benfeitor_id }        
        flash[:notice] = "Registro criado com sucesso!"
      else
        format.html { redirect_to :action => "new", :benfeitor => params[:benfeitor] }        
        flash[:warning] = "Os campos com * são obrigatórios, preencha-os corretamente."
      end
    end
  end

  # PUT /doacoes/1
  # PUT /doacoes/1.json
  def update
    @doacao = Doacao.find(params[:id])

    respond_to do |format|
      if @doacao.update_attributes(params[:doacao])
         format.html { redirect_to :action => :index, :benfeitor => @doacao.benfeitor_id}
        flash[:notice] = "Registro alterado com sucesso!"
      else
        format.html { redirect_to :action => "edit", :benfeitor => params[:benfeitor] }
        format.json { render json: @doacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doacoes/1
  # DELETE /doacoes/1.json
  def destroy
    @doacao = Doacao.find(params[:id])
    @doacao.destroy

    respond_to do |format|
      format.html { redirect_to :action => :index, :benfeitor => @doacao.benfeitor_id }
      format.json { head :no_content }
    end
  end
end