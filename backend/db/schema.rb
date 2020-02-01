# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_01_130907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.string "title"
    t.string "city"
    t.string "country"
    t.bigint "type_id", null: false
    t.integer "floor_area"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.integer "min_stay_nights"
    t.integer "max_guests"
    t.bigint "rating_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rating_id"], name: "index_accommodations_on_rating_id"
    t.index ["type_id"], name: "index_accommodations_on_type_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "value"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "accommodations", "ratings"
  add_foreign_key "accommodations", "types"
end
