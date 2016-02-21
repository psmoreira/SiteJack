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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160214163545) do

  create_table "eventos", force: :cascade do |t|
    t.string   "descricao"
    t.string   "tipoEvento"
    t.string   "localEvento"
    t.string   "eventoParent"
    t.date     "dataInicio"
    t.datetime "dataInicioEvento"
    t.datetime "dataFimEvento"
    t.integer  "numPessoas"
    t.float    "precoPorPessoa"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.time     "horaInicio"
    t.time     "horaFim"
    t.time     "duracaoEvento"
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string   "nome",                limit: 200
    t.string   "morada"
    t.string   "contacto"
    t.string   "email"
    t.string   "contribuinte"
    t.string   "observacoes"
    t.string   "fotografia"
    t.integer  "prioridade"
    t.boolean  "activo"
    t.boolean  "recibo"
    t.float    "precoHora1"
    t.float    "precoHora2"
    t.float    "precoDia"
    t.string   "localTrabalho"
    t.float    "totalRecebido"
    t.datetime "dataUltimoTrabalho"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "pagamentos", force: :cascade do |t|
    t.float    "precoHora1"
    t.float    "numTotalHoras"
    t.float    "numHorasPagas"
    t.boolean  "regularizado"
    t.datetime "dataPagamento"
    t.float    "precoTotal"
    t.datetime "dataCriacao"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "trabalho_id"
    t.integer  "funcionario_id"
    t.integer  "evento_id"
  end

  add_index "pagamentos", ["evento_id"], name: "index_pagamentos_on_evento_id"
  add_index "pagamentos", ["funcionario_id"], name: "index_pagamentos_on_funcionario_id"
  add_index "pagamentos", ["trabalho_id"], name: "index_pagamentos_on_trabalho_id"

  create_table "trabalhos", force: :cascade do |t|
    t.float    "noteumTotalHoras"
    t.float    "numHorasPagas"
    t.float    "precoHora1"
    t.float    "precoDia"
    t.float    "precoTotal"
    t.boolean  "regularizado"
    t.boolean  "recibo"
    t.datetime "dataPagamento"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "evento_id"
    t.integer  "funcionario_id"
    t.time     "horaInicio"
    t.time     "horaFim"
    t.time     "duracaoTrabalho"
    t.date     "dataTrabalho"
    t.datetime "dataHoraInicio"
    t.datetime "dataHoraFim"
  end

  add_index "trabalhos", ["evento_id"], name: "index_trabalhos_on_evento_id"
  add_index "trabalhos", ["funcionario_id"], name: "index_trabalhos_on_funcionario_id"

end
