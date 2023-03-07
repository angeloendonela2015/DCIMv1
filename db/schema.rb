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

ActiveRecord::Schema.define(version: 2023_02_28_031926) do

  create_table "devices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "unitname"
    t.string "ipaddress"
    t.string "sensore_type"
    t.string "community"
    t.string "oid"
    t.string "alarm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "snmpdevices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "device_name"
    t.string "device_ip"
    t.string "community_type"
    t.string "outlet_type"
    t.string "oid_outletname1"
    t.string "oid_outletname2"
    t.string "oid_outletname3"
    t.string "oid_outletname4"
    t.string "oid_outletname5"
    t.string "oid_outletname6"
    t.string "oid_outletname7"
    t.string "oid_outletname8"
    t.string "oid_status1"
    t.string "oid_status2"
    t.string "oid_status3"
    t.string "oid_status4"
    t.string "oid_status5"
    t.string "oid_status6"
    t.string "oid_status7"
    t.string "oid_status8"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ssms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "unitname"
    t.string "ipaddress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "firstname"
    t.string "middlename"
    t.string "lastname"
    t.string "userinterface"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
