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

ActiveRecord::Schema[8.0].define(version: 2025_06_16_205632) do
  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.date "dob"
    t.string "email"
    t.string "mobile_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipaments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "available"
    t.integer "price_per_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rents", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "equipament_id", null: false
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipament_id"], name: "index_rents_on_equipament_id"
    t.index ["user_id"], name: "index_rents_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "equipament_id", null: false
    t.string "status", default: "pending"
    t.date "period_start", null: false
    t.date "period_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipament_id"], name: "index_schedules_on_equipament_id"
    t.index ["status"], name: "index_schedules_on_status"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "rents", "equipaments"
  add_foreign_key "rents", "users"
  add_foreign_key "schedules", "equipaments"
end
