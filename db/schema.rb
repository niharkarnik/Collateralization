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

ActiveRecord::Schema.define(version: 20170218034257) do

  create_table "allocated_margin", primary_key: ["id_allocated_margin", "allocation_date", "allocation_run_seq"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "id_allocated_margin",       null: false
    t.date     "allocation_date",           null: false
    t.integer  "allocation_run_seq",        null: false
    t.integer  "source_id"
    t.integer  "source_alloc_quantity"
    t.integer  "collateral_id"
    t.integer  "collateral_alloc_quantity"
    t.datetime "s_insrt_tms"
  end

  create_table "allocsources", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "allocationdate"
    t.integer  "allocationrunseq"
    t.integer  "source_id"
    t.integer  "sourceallocquantity"
    t.integer  "collateral_id"
    t.integer  "collateralallocquantity"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["collateral_id"], name: "index_allocsources_on_collateral_id", using: :btree
    t.index ["source_id"], name: "index_allocsources_on_source_id", using: :btree
  end

  create_table "allocsources_o", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "idallocatedmargin"
    t.date     "allocationdate"
    t.integer  "allocationrunseq"
    t.integer  "source_id"
    t.integer  "sourceallocquantity"
    t.integer  "collateral_id"
    t.integer  "collateralallocquantity"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["collateral_id"], name: "index_allocsources_o_on_collateral_id", using: :btree
    t.index ["source_id"], name: "index_allocsources_o_on_source_id", using: :btree
  end

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "text",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "collateral_data", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "field1",        limit: 45
    t.string  "field2",        limit: 45
    t.string  "field3",        limit: 45
    t.string  "field4",        limit: 45
    t.string  "field5",        limit: 45
    t.string  "margin_type",   limit: 1
    t.integer "quantity"
    t.decimal "amount",                      precision: 15, scale: 3
    t.string  "compare_field", limit: 20000
  end

  create_table "collaterals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "field1"
    t.string   "field2"
    t.string   "field3"
    t.string   "field4"
    t.string   "field5"
    t.string   "margintype"
    t.integer  "quantity"
    t.decimal  "amount",       precision: 15, scale: 3
    t.string   "comparefield"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "source_data", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "Field1",        limit: 45
    t.string  "Field2",        limit: 45
    t.string  "Field3",        limit: 45
    t.string  "Field4",        limit: 45
    t.string  "Field5",        limit: 45
    t.integer "Quantity"
    t.decimal "Amount",                      precision: 15, scale: 3
    t.string  "compare_field", limit: 20000
  end

  create_table "sources", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "field1"
    t.string   "field2"
    t.string   "field3"
    t.string   "field4"
    t.string   "field5"
    t.integer  "quantity"
    t.decimal  "amount",       precision: 15, scale: 3
    t.string   "comparefield"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_foreign_key "allocsources", "collaterals"
  add_foreign_key "allocsources", "sources"
  add_foreign_key "allocsources_o", "collaterals"
  add_foreign_key "allocsources_o", "sources"
end
