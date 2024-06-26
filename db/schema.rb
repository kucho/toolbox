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

ActiveRecord::Schema[7.0].define(version: 2022_12_27_052224) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "account_active_session_keys",
               primary_key: %w[account_id session_id],
               force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "session_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "last_use", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["account_id"],
            name: "index_account_active_session_keys_on_account_id"
  end

  create_table "account_authentication_audit_logs", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.datetime "at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.text "message", null: false
    t.jsonb "metadata"
    t.index %w[account_id at], name: "audit_account_at_idx"
    t.index ["account_id"],
            name: "index_account_authentication_audit_logs_on_account_id"
    t.index ["at"], name: "audit_at_idx"
  end

  create_table "account_login_change_keys", force: :cascade do |t|
    t.string "key", null: false
    t.string "login", null: false
    t.datetime "deadline", null: false
  end

  create_table "account_password_reset_keys", force: :cascade do |t|
    t.string "key", null: false
    t.datetime "deadline", null: false
    t.datetime "email_last_sent",
               default: -> { "CURRENT_TIMESTAMP" },
               null: false
  end

  create_table "account_remember_keys", force: :cascade do |t|
    t.string "key", null: false
    t.datetime "deadline", null: false
  end

  create_table "account_verification_keys", force: :cascade do |t|
    t.string "key", null: false
    t.datetime "requested_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "email_last_sent",
               default: -> { "CURRENT_TIMESTAMP" },
               null: false
  end

  create_table "accounts", force: :cascade do |t|
    t.integer "status", default: 1, null: false
    t.uuid "uuid", default: -> { "gen_random_uuid()" }
    t.citext "email", null: false
    t.string "password_hash"
    t.index ["email"],
            name: "index_accounts_on_email",
            unique: true,
            where: "(status = ANY (ARRAY[1, 2]))"
  end

  create_table "event_store_events", force: :cascade do |t|
    t.uuid "event_id", null: false
    t.string "event_type", null: false
    t.binary "metadata"
    t.binary "data", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "valid_at", precision: nil
    t.index ["created_at"], name: "index_event_store_events_on_created_at"
    t.index ["event_id"],
            name: "index_event_store_events_on_event_id",
            unique: true
    t.index ["event_type"], name: "index_event_store_events_on_event_type"
    t.index ["valid_at"], name: "index_event_store_events_on_valid_at"
  end

  create_table "event_store_events_in_streams", force: :cascade do |t|
    t.string "stream", null: false
    t.integer "position"
    t.uuid "event_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["created_at"],
            name: "index_event_store_events_in_streams_on_created_at"
    t.index %w[stream event_id],
            name: "index_event_store_events_in_streams_on_stream_and_event_id",
            unique: true
    t.index %w[stream position],
            name: "index_event_store_events_in_streams_on_stream_and_position",
            unique: true
  end

  create_table "organization_accounts", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_organization_accounts_on_account_id"
    t.index ["organization_id"],
            name: "index_organization_accounts_on_organization_id"
  end

  create_table "organization_active_sessions", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "account_id", null: false
    t.bigint "session_key_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"],
            name: "index_organization_active_sessions_on_account_id"
    t.index ["organization_id"],
            name: "index_organization_active_sessions_on_organization_id"
    t.index ["session_key_id"],
            name: "index_organization_active_sessions_on_session_key_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }
    t.string "name"
    t.string "slug"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "domain"
    t.string "subdomain"
    t.string "default_currency", default: "usd"
  end

  create_table "product_stocks", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.float "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index %w[organization_id product_id unit_price],
            name: "uniq_product_stock_in_org",
            unique: true
    t.index ["organization_id"], name: "index_product_stocks_on_organization_id"
    t.index ["product_id"], name: "index_product_stocks_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.uuid "uuid", default: -> { "gen_random_uuid()" }
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency"
    t.index ["organization_id"], name: "index_products_on_organization_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.uuid "uuid", default: -> { "gen_random_uuid()" }
    t.string "last_name"
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_profiles_on_account_id"
  end

  create_table "team_accounts", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "account_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_team_accounts_on_account_id"
    t.index ["organization_id"], name: "index_team_accounts_on_organization_id"
    t.index ["team_id"], name: "index_team_accounts_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.uuid "uuid", default: -> { "gen_random_uuid()" }
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_teams_on_organization_id"
  end

  add_foreign_key "account_active_session_keys", "accounts"
  add_foreign_key "account_authentication_audit_logs", "accounts"
  add_foreign_key "account_login_change_keys", "accounts", column: "id"
  add_foreign_key "account_password_reset_keys", "accounts", column: "id"
  add_foreign_key "account_remember_keys", "accounts", column: "id"
  add_foreign_key "account_verification_keys", "accounts", column: "id"
  add_foreign_key "organization_accounts", "accounts"
  add_foreign_key "organization_accounts", "organizations"
  add_foreign_key "organization_active_sessions", "accounts"
  add_foreign_key "organization_active_sessions", "organizations"
  add_foreign_key "product_stocks", "products"
  add_foreign_key "profiles", "accounts"
  add_foreign_key "team_accounts", "accounts"
  add_foreign_key "team_accounts", "teams"
end
