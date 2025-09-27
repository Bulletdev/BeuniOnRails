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

ActiveRecord::Schema[7.1].define(version: 2025_09_27_202504) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name", null: false
    t.date "birth_date", null: false
    t.string "cpf", null: false
    t.string "email"
    t.string "phone"
    t.string "position"
    t.string "department"
    t.date "admission_date"
    t.string "street"
    t.string "number"
    t.string "complement"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_employees_on_active"
    t.index ["birth_date"], name: "index_employees_on_birth_date"
    t.index ["department"], name: "index_employees_on_department"
    t.index ["organization_id", "cpf"], name: "index_employees_on_organization_id_and_cpf", unique: true
    t.index ["organization_id"], name: "index_employees_on_organization_id"
  end

  create_table "gift_campaigns", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name", null: false
    t.text "description"
    t.string "default_gift_type"
    t.decimal "budget_per_gift", precision: 10, scale: 2
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_gift_campaigns_on_active"
    t.index ["organization_id"], name: "index_gift_campaigns_on_organization_id"
  end

  create_table "gift_shipments", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "employee_id", null: false
    t.bigint "gift_campaign_id", null: false
    t.date "scheduled_date"
    t.date "sent_date"
    t.date "delivered_date"
    t.string "status", default: "scheduled"
    t.string "tracking_code"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id", "scheduled_date"], name: "index_gift_shipments_on_employee_id_and_scheduled_date"
    t.index ["employee_id"], name: "index_gift_shipments_on_employee_id"
    t.index ["gift_campaign_id"], name: "index_gift_shipments_on_gift_campaign_id"
    t.index ["organization_id"], name: "index_gift_shipments_on_organization_id"
    t.index ["scheduled_date"], name: "index_gift_shipments_on_scheduled_date"
    t.index ["status"], name: "index_gift_shipments_on_status"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.string "cnpj", null: false
    t.string "email"
    t.string "phone"
    t.text "address"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cnpj"], name: "index_organizations_on_cnpj", unique: true
    t.index ["name"], name: "index_organizations_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.string "role", default: "member", null: false
    t.bigint "organization_id", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "employees", "organizations"
  add_foreign_key "gift_campaigns", "organizations"
  add_foreign_key "gift_shipments", "employees"
  add_foreign_key "gift_shipments", "gift_campaigns"
  add_foreign_key "gift_shipments", "organizations"
  add_foreign_key "users", "organizations"
end
