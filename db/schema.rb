# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120829145539) do

  create_table "cidades", :force => true do |t|
    t.string   "nome"
    t.integer  "estado_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "estados", :force => true do |t|
    t.string   "sigla"
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vocacionados", :force => true do |t|
    t.string   "nome"
    t.datetime "nascimento"
    t.integer  "cod_escolaridade"
    t.string   "endereco"
    t.string   "bairro"
    t.string   "cep"
    t.string   "complemento_endereco"
    t.integer  "cod_estado"
    t.string   "cidade"
    t.string   "telefone_residencial"
    t.string   "celular"
    t.string   "email"
    t.datetime "primeiro_contato"
    t.boolean  "ativo"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

end
