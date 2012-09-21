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

ActiveRecord::Schema.define(:version => 20120920045124) do

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

  create_table "observacao_vocacionados", :force => true do |t|
    t.integer  "vocacionado_id"
    t.text     "descricao"
    t.date     "data"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "observacao_vocacionados", ["vocacionado_id"], :name => "index_observacao_vocacionados_on_vocacionado_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "usuarios", :force => true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "senha"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vocacionados", :force => true do |t|
    t.string  "nome"
    t.date    "nascimento"
    t.string  "escolaridade"
    t.string  "endereco"
    t.string  "bairro"
    t.string  "cep"
    t.string  "complemento_endereco"
    t.integer "cod_estado"
    t.integer "cidade_id"
    t.string  "telefone_residencial"
    t.string  "celular"
    t.string  "email"
    t.date    "primeiro_contato"
    t.boolean "ativo"
    t.date    "created_at",           :null => false
    t.date    "updated_at",           :null => false
  end

end
