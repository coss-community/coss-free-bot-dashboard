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

ActiveRecord::Schema.define(version: 2018_12_21_144148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stats", force: :cascade do |t|
    t.decimal "profit_gained", default: "0.0", null: false
    t.decimal "volume_produced", default: "0.0", null: false
    t.decimal "fees_paid_left", default: "0.0", null: false
    t.decimal "fees_paid_right", default: "0.0", null: false
    t.decimal "fees_paid_cft", default: "0.0", null: false
    t.integer "trades_completed", default: 0, null: false
    t.text "last_trade_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trades", force: :cascade do |t|
    t.string "buy_order_id", null: false
    t.string "sell_order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
