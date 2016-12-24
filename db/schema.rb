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

ActiveRecord::Schema.define(version: 20161101152142) do

  create_table "apartments", force: :cascade do |t|
    t.string   "address"
    t.integer  "price"
    t.integer  "beds"
    t.integer  "baths"
    t.integer  "square_footage"
    t.boolean  "fee"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "link_address"
    t.integer  "time_from_megans"
    t.integer  "time_from_pipers"
    t.string   "neighborhood"
    t.index ["address"], name: "index_apartments_on_address"
    t.index ["baths"], name: "index_apartments_on_baths"
    t.index ["beds"], name: "index_apartments_on_beds"
    t.index ["neighborhood"], name: "index_apartments_on_neighborhood"
    t.index ["price"], name: "index_apartments_on_price"
    t.index ["square_footage"], name: "index_apartments_on_square_footage"
    t.index ["time_from_megans"], name: "index_apartments_on_time_from_megans"
    t.index ["time_from_pipers"], name: "index_apartments_on_time_from_pipers"
  end

end
