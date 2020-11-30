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

ActiveRecord::Schema.define(version: 2020_11_28_065930) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "debts", force: :cascade do |t|
    t.string "title"
    t.integer "total"
    t.boolean "is_paid"
    t.integer "user_id"
    t.string "expenses"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_debts_on_user_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "debt_id"
    t.string "description"
    t.float "amount"
    t.date "date_due"
    t.string "bank_account"
    t.boolean "is_automatic"
    t.boolean "is_paid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["debt_id"], name: "index_expenses_on_debt_id"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "user_debts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "debt_id"
    t.integer "expense_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["debt_id"], name: "index_user_debts_on_debt_id"
    t.index ["expense_id"], name: "index_user_debts_on_expense_id"
    t.index ["user_id"], name: "index_user_debts_on_user_id"
  end

  create_table "user_expenses", force: :cascade do |t|
    t.integer "expense_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expense_id"], name: "index_user_expenses_on_expense_id"
    t.index ["user_id"], name: "index_user_expenses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
