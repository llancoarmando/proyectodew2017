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

ActiveRecord::Schema.define(version: 0) do

  create_table "cliente", primary_key: "idcliente", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "nombre",            limit: 20, null: false
    t.string  "ap_paterno",        limit: 30, null: false
    t.string  "ap_materno",        limit: 30, null: false
    t.string  "sexo",              limit: 1,  null: false
    t.string  "tipo_documento",    limit: 9,  null: false
    t.integer "num_documento",                null: false
    t.string  "correo",            limit: 30
    t.string  "nro_celular",       limit: 9
    t.string  "direccion_cliente", limit: 45
    t.string  "contraseña",        limit: 15, null: false, collation: "utf8_bin"
    t.index ["correo"], name: "Correo_UNIQUE", unique: true, using: :btree
    t.index ["idcliente"], name: "idCLIENTE_UNIQUE", unique: true, using: :btree
    t.index ["nro_celular"], name: "NroCelular_UNIQUE", unique: true, using: :btree
    t.index ["num_documento"], name: "NumDocumento_UNIQUE", unique: true, using: :btree
  end

  create_table "club", primary_key: "idclub", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre_club",    limit: 45
    t.string "direccion_club", limit: 45
    t.index ["idclub"], name: "idCLUB_UNIQUE", unique: true, using: :btree
  end

  create_table "juego", primary_key: "idjuego", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "nombre_juego",        limit: 45,                             null: false
    t.text    "desc_juego",          limit: 65535
    t.text    "materiales",          limit: 65535
    t.decimal "costo_juego_persona",               precision: 10, scale: 2, null: false
    t.index ["idjuego"], name: "idJUEGO_UNIQUE", unique: true, using: :btree
    t.index ["nombre_juego"], name: "NomJuego_UNIQUE", unique: true, using: :btree
  end

  create_table "oferta", primary_key: "idoferta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date    "fecha_caducidad",                 null: false
    t.text    "desc_oferta",       limit: 65535
    t.text    "ubicacion_web",     limit: 65535
    t.integer "cantidad_personas",               null: false
    t.integer "idjuego",                         null: false
    t.integer "idservicio",                      null: false
    t.index ["idjuego"], name: "fk_OFERTA_JUEGO1_idx", using: :btree
    t.index ["idoferta"], name: "idOFERTA_UNIQUE", unique: true, using: :btree
    t.index ["idservicio"], name: "fk_OFERTA_SERVICIO1_idx", using: :btree
  end

  create_table "servicio", primary_key: "idservicio", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "nombre_servicio",    limit: 45
    t.text    "desc_servicio",      limit: 65535
    t.decimal "costo_serv_persona",               precision: 10, scale: 2, null: false
    t.index ["idservicio"], name: "idSERVICIO_UNIQUE", unique: true, using: :btree
  end

  create_table "solicitud", primary_key: "idsolicitud", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date    "fecha_ini"
    t.integer "cant_personas"
    t.integer "idclub",                                 null: false
    t.integer "idcliente",                              null: false
    t.decimal "precio",        precision: 10, scale: 2
    t.date    "fecha_fin"
    t.index ["idcliente"], name: "fk_DIACAMPO_CLIENTE1_idx", using: :btree
    t.index ["idclub"], name: "fk_DIACAMPO_CLUB_idx", using: :btree
    t.index ["idsolicitud"], name: "idDIACAMPO_UNIQUE", unique: true, using: :btree
  end

  create_table "solicitud_has_juego", primary_key: ["idsolicitud", "idjuego"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "idsolicitud",    null: false
    t.integer "idjuego",        null: false
    t.integer "cant_jugadores"
    t.index ["idjuego"], name: "fk_SOLICITUD_has_JUEGO_JUEGO1_idx", using: :btree
    t.index ["idsolicitud"], name: "fk_SOLICITUD_has_JUEGO_SOLICITUD1_idx", using: :btree
  end

  create_table "solicitud_has_servicio", primary_key: ["idsolicitud", "idservicio"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "idsolicitud", null: false
    t.integer "idservicio",  null: false
    t.index ["idservicio"], name: "fk_SOLICITUD_has_SERVICIO_SERVICIO1_idx", using: :btree
    t.index ["idsolicitud"], name: "fk_SOLICITUD_has_SERVICIO_SOLICITUD1_idx", using: :btree
  end

  add_foreign_key "oferta", "juego", column: "idjuego", primary_key: "idjuego", name: "fk_OFERTA_JUEGO1"
  add_foreign_key "oferta", "servicio", column: "idservicio", primary_key: "idservicio", name: "fk_OFERTA_SERVICIO1"
  add_foreign_key "solicitud", "cliente", column: "idcliente", primary_key: "idcliente", name: "fk_DIACAMPO_CLIENTE1"
  add_foreign_key "solicitud", "club", column: "idclub", primary_key: "idclub", name: "fk_DIACAMPO_CLUB"
  add_foreign_key "solicitud_has_juego", "juego", column: "idjuego", primary_key: "idjuego", name: "fk_SOLICITUD_has_JUEGO_JUEGO1"
  add_foreign_key "solicitud_has_juego", "solicitud", column: "idsolicitud", primary_key: "idsolicitud", name: "fk_SOLICITUD_has_JUEGO_SOLICITUD1"
  add_foreign_key "solicitud_has_servicio", "servicio", column: "idservicio", primary_key: "idservicio", name: "fk_SOLICITUD_has_SERVICIO_SERVICIO1"
  add_foreign_key "solicitud_has_servicio", "solicitud", column: "idsolicitud", primary_key: "idsolicitud", name: "fk_SOLICITUD_has_SERVICIO_SOLICITUD1"
end
