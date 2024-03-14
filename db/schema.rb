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

ActiveRecord::Schema[7.1].define(version: 2024_03_14_092601) do
  create_table "branches", charset: "utf8mb3", force: :cascade do |t|
    t.string "company_code"
    t.string "company_name"
    t.string "branch_code"
    t.string "branch_name"
    t.string "address"
    t.string "area"
    t.string "email"
    t.string "phone"
    t.string "website"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", charset: "utf8mb3", force: :cascade do |t|
    t.string "company_code"
    t.string "company_name"
    t.string "address"
    t.string "email"
    t.string "phone"
    t.string "website"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "avatar_url"
  end

  create_table "divisions", charset: "utf8mb3", force: :cascade do |t|
    t.string "company_code"
    t.string "company_name"
    t.string "branch_code"
    t.string "branch_name"
    t.string "division_code"
    t.string "division_name"
    t.string "address"
    t.string "area"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
