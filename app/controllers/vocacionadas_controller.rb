# -*- coding: utf-8 -*-

class VocacionadasController < ApplicationController
  # GET /vocacionadas
  # GET /vocacionadas.json
  def index
    session[:filtro_busca_vocacionadas] = nil
    @vocacionadaFull = Vocacionada.search(params).where(" cod_estado is not null and cidade_id is not null ")
    @vocacionada = Vocacionada.search(params).paginate(:per_page => 5, :page => params[:page])
    session[:filtro_busca_vocacionadas] = @vocacionadaFull
  end

  def generate_registration_form
    @vocacionada = Vocacionada.find(params[:id])   

      output = FichaCadastralVocacionada.new.to_pdf(@vocacionada)

      respond_to do |format|
     
        format.pdf do         
          send_data output, :filename => "vocacionada_#{@vocacionada.created_at.strftime("%d/%m/%Y")}.pdf",
                            :type => "application/pdf",
                            :disposition => "inline"
        end
      end  
  end

  def generate_labels
    @vocacionada = session[:filtro_busca_vocacionadas]

    output = EtiquetasVocacionadas.new.to_pdf(@vocacionada)

    respond_to do |format|
   
      format.pdf do         
        send_data output, :filename => "etiquetas_vocacionadas#{DateTime.now}.pdf",
                          :type => "application/pdf"        
      end
    end
  end
  
  def generate_list
    @vocacionada = session[:filtro_busca_vocacionadas]

    output = ListagemVocacionadas.new(@vocacionada)

    respond_to do |format|
   
      format.pdf do         
        send_data output.render, 
                            :filename => "listagem_vocacionadas#{DateTime.now}.pdf",
                            :type => "application/pdf",
                            :disposition => "inline"        
      end
    end
  end

  # GET /vocacionadas/new
  # GET /vocacionadas/new.json
  def new
    @vocacionada = Vocacionada.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vocacionada }
    end
  end

  # GET /vocacionadas/1/edit
  def edit
    @vocacionada = Vocacionada.find(params[:id])
  end

  # POST /vocacionadas
  # POST /vocacionadas.json
  def create
    @vocacionada = Vocacionada.new(params[:vocacionada])

    respond_to do |format|
      if @vocacionada.save
        format.html { redirect_to vocacionadas_url}
       flash[:notice] = "Registro criado com sucesso!"
      else
        format.html { render action: "new" }
        flash[:warning] = "Os campos com * são obrigatórios, preencha-os corretamente."
      end
    end
  end

  # PUT /vocacionadas/1
  # PUT /vocacionadas/1.json
  def update
    @vocacionada = Vocacionada.find(params[:id])

    respond_to do |format|
      if @vocacionada.update_attributes(params[:vocacionada])
        format.html { redirect_to vocacionadas_url}
        flash[:notice] = "Registro alterado com sucesso!"
      else
        format.html { render action: "edit" }
        format.json { render json: @vocacionada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vocacionadas/1
  # DELETE /vocacionadas/1.json
  def destroy
    @vocacionada = Vocacionada.find(params[:id])
    @vocacionada.destroy

    respond_to do |format|
      format.html { redirect_to vocacionadas_url }
      format.json { head :no_content }
    end
  end
end
