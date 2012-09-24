# -*- coding: utf-8 -*-

class UsuariosController < ApplicationController

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.search(params).paginate(:per_page => 5, :page => params[:page])
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @usuario }
    end
  end

  # GET /usuarios/new
  # GET /usuarios/new.json
  def new
    @usuario = Usuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @usuario }
    end
  end

  # GET /usuarios/1/edit
  def edit
    @usuario = Usuario.find(params[:id])
  end

  # POST /usuarios
  # POST /usuarios.json
  def create    

    @usuario = Usuario.new(params[:usuario])
    @usuario.senha  = Digest::MD5.hexdigest(@usuario.senha)    

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to usuarios_url }
        flash[:notice] = "Usuário cadastrado com sucesso!"
      else
        format.html { render action: "new" }
        flash[:warning] = "Os campos com * são obrigatórios, preencha-os corretamente."
      end
    end
  end

  # PUT /usuarios/1
  # PUT /usuarios/1.json
  def update
    @usuario = Usuario.find(params[:id])    

    respond_to do |format|
      if @usuario.update_attributes(params[:usuario])
        format.html { redirect_to usuarios_url }
        flash[:notice] = "Usuário alterado com sucesso!"
      else
        format.html { render action: "edit" }
        flash[:error] = "Ocorreu um erro e o usuário não foi alterado!"
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to usuarios_url }
      format.json { head :no_content }
    end
  end
end
