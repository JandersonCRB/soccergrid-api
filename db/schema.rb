# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_07_26_192843) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brazilian_serie_a_champions", force: :cascade do |t|
    t.integer "year"
    t.string "champion_key"
    t.string "vice_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "club_colors", force: :cascade do |t|
    t.string "club_key"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "club_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grid_answers", force: :cascade do |t|
    t.bigint "grid_id", null: false
    t.integer "i"
    t.integer "j"
    t.string "club_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grid_id"], name: "index_grid_answers_on_grid_id"
  end

  create_table "grid_tips", force: :cascade do |t|
    t.bigint "grid_id", null: false
    t.integer "i"
    t.integer "j"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grid_id"], name: "index_grid_tips_on_grid_id"
  end

  create_table "grid_user_answers", force: :cascade do |t|
    t.bigint "grid_id", null: false
    t.integer "i"
    t.integer "j"
    t.string "answer"
    t.string "remote_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grid_id"], name: "index_grid_user_answers_on_grid_id"
  end

  create_table "grids", force: :cascade do |t|
    t.date "active_on"
    t.integer "grid_number", null: false
    t.integer "grid_rows", null: false
    t.integer "grid_columns", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active_on"], name: "index_grids_on_active_on", unique: true, where: "(active_on IS NOT NULL)"
  end

  add_foreign_key "grid_answers", "grids"
  add_foreign_key "grid_tips", "grids"
  add_foreign_key "grid_user_answers", "grids"
end
