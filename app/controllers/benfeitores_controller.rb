# -*- coding: utf-8 -*-

class BenfeitoresController < ApplicationController
  # GET /benfeitores
  # GET /benfeitores.json
  def index    
    session[:filtro_busca_benfeitor] = nil
    @benfeitorFull = Benfeitor.search(params).where(" cod_estado is not null and cidade_id is not null ")
    @benfeitores = Benfeitor.search(params).paginate(:per_page => 5, :page => params[:page])
    session[:filtro_busca_benfeitor] = @benfeitorFull
  end

  def generate_registration_form
    
    @benfeitor = Benfeitor.find(params[:id])   

      output = FichaCadastralBenfeitor.new(@benfeitor)

      respond_to do |format|
        format.html
        format.pdf do         
          send_data output.render, :filename => "benfeitor#{@benfeitor.created_at.strftime("%d/%m/%Y")}.pdf",
                            :type => "application/pdf"                            
        end
      end  
  end

  def generate_labels
    @benfeitor = session[:filtro_busca_benfeitor]

    output = EtiquetasBenfeitores.new.to_pdf(@benfeitor)

    respond_to do |format|
      format.html
      format.pdf do         
        send_data output, :filename => "etiquetas_benfeitor#{DateTime.now}.pdf",
                          :type => "application/pdf"        
      end
    end
  end
  
  def generate_list
    @benfeitor = session[:filtro_busca_benfeitor]

    output = ListagemBenfeitores.new(@benfeitor)

    respond_to do |format|
      format.html
      format.pdf do         
        send_data output.render, 
                            :filename => "listagem_benfeitores#{DateTime.now}.pdf",
                            :type => "application/pdf"                                  
      end
    end
  end

  # GET /benfeitores/new
  # GET /benfeitores/new.json
  def new
    @benfeitor = Benfeitor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @benfeitor }
    end
  end

  # GET /benfeitores/1/edit
  def edit
    @benfeitor = Benfeitor.find(params[:id])
  end

  # POST /benfeitores
  # POST /benfeitores.json
  def create
    @benfeitor = Benfeitor.new(params[:benfeitor])

    respond_to do |format|
      if @benfeitor.save
        format.html { redirect_to benfeitores_url }
        flash[:notice] = "Registro criado com sucesso!"
      else
        format.html { render action: "new" }
        flash[:warning] = "Os campos com * são obrigatórios, preencha-os corretamente."
      end
    end
  end

  # PUT /benfeitores/1
  # PUT /benfeitores/1.json
  def update
    @benfeitor = Benfeitor.find(params[:id])

    respond_to do |format|
      if @benfeitor.update_attributes(params[:benfeitor])
        format.html { redirect_to benfeitores_url }
        flash[:notice] = "Registro alterado com sucesso!"
      else
        format.html { redirect_to action: "edit" }
        flash[:warning] = "Os campos com * são obrigatórios, preencha-os corretamente."
      end
    end
  end

  # DELETE /benfeitores/1
  # DELETE /benfeitores/1.json
  def destroy
    @benfeitor = Benfeitor.find(params[:id])
    @benfeitor.destroy

    respond_to do |format|
      format.html { redirect_to benfeitores_url }
      format.json { head :no_content }
    end
  end
end
