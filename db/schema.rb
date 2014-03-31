# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140329183049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "institute_images", force: true do |t|
    t.integer  "institute_id"
    t.string   "image_name",   limit: 100
    t.boolean  "primary",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "institute_images", ["institute_id"], name: "index_institute_images_on_institute_id", using: :btree

  create_table "institute_profiles", force: true do |t|
    t.integer  "institute_id"
    t.string   "name_logo",    limit: 100
    t.boolean  "has_logo",                 default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "institute_profiles", ["institute_id"], name: "index_institute_profiles_on_institute_id", using: :btree

  create_table "institute_queries", force: true do |t|
    t.integer  "institute_id"
    t.string   "name_query",             limit: 100
    t.boolean  "has_result",                          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type_content",           limit: 50
    t.string   "subject_category",       limit: 50
    t.string   "word_description",       limit: 1000
    t.integer  "type_content_index"
    t.integer  "subject_category_index"
  end

  add_index "institute_queries", ["institute_id"], name: "index_institute_queries_on_institute_id", using: :btree

  create_table "institute_query_results", force: true do |t|
    t.integer  "institute_id"
    t.integer  "institute_query_id"
    t.string   "name_result",                      limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_product_description_id"
    t.string   "description",                      limit: 200
    t.decimal  "price",                                        precision: 8, scale: 2
  end

  add_index "institute_query_results", ["institute_id"], name: "index_institute_query_results_on_institute_id", using: :btree
  add_index "institute_query_results", ["institute_query_id"], name: "index_institute_query_results_on_institute_query_id", using: :btree

  create_table "institute_settings", force: true do |t|
    t.integer  "institute_id"
    t.string   "background",   limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "institute_settings", ["institute_id"], name: "index_institute_settings_on_institute_id", using: :btree

  create_table "institutes", force: true do |t|
    t.string   "name",                       limit: 100
    t.string   "address",                    limit: 100
    t.string   "city",                       limit: 100
    t.string   "state",                      limit: 50
    t.string   "country",                    limit: 100
    t.integer  "zip"
    t.string   "main_phone",                 limit: 100
    t.string   "main_contact_email",         limit: 100
    t.string   "public_private",             limit: 10
    t.integer  "number_students"
    t.integer  "number_computing_devices"
    t.string   "post_rfp_link",              limit: 100
    t.string   "company_contact_name_first", limit: 100
    t.string   "company_contact_name_last",  limit: 100
    t.string   "name_title",                 limit: 50
    t.string   "company_contact_phone",      limit: 50
    t.string   "company_contact_email",      limit: 100
    t.boolean  "allow_add_products"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "journalposterpurchases", force: true do |t|
    t.integer  "id_user"
    t.integer  "id_journalposter"
    t.string   "description"
    t.decimal  "price",            precision: 5, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "journalposters", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.integer  "price"
  end

  create_table "publisher_images", force: true do |t|
    t.integer  "publisher_id"
    t.string   "image_name",   limit: 100
    t.boolean  "primary",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_images", ["publisher_id"], name: "index_publisher_images_on_publisher_id", using: :btree

  create_table "publisher_product_descriptions", force: true do |t|
    t.integer  "publisher_product_id"
    t.integer  "publisher_id"
    t.string   "description",            limit: 1000
    t.decimal  "price",                               precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type_content",           limit: 50
    t.string   "subject_category",       limit: 50
    t.integer  "type_content_index"
    t.integer  "subject_category_index"
    t.string   "name_product",           limit: 100
    t.string   "core_supplemental",      limit: 50
    t.string   "source_url",             limit: 300
    t.string   "topic",                  limit: 200
    t.string   "lesson_plan_subject",    limit: 300
    t.text     "word_description"
    t.string   "age_appropriate",        limit: 50
    t.integer  "age_appropriate_index"
    t.string   "grade",                  limit: 50
    t.integer  "grade_index"
    t.text     "metadata"
    t.string   "platform",               limit: 50
    t.integer  "platform_index"
    t.string   "versions",               limit: 300
    t.string   "pricing_model",          limit: 50
    t.integer  "pricing_model_index"
  end

  add_index "publisher_product_descriptions", ["publisher_id"], name: "index_publisher_product_descriptions_on_publisher_id", using: :btree
  add_index "publisher_product_descriptions", ["publisher_product_id"], name: "index_publisher_product_descriptions_on_publisher_product_id", using: :btree

  create_table "publisher_product_logos", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.string   "image_name",           limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_product_logos", ["publisher_id"], name: "index_publisher_product_logos_on_publisher_id", using: :btree
  add_index "publisher_product_logos", ["publisher_product_id"], name: "index_publisher_product_logos_on_publisher_product_id", using: :btree

  create_table "publisher_product_metadatatags", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name_metadata",        limit: 100
    t.text     "text_metadata"
  end

  add_index "publisher_product_metadatatags", ["publisher_id"], name: "index_publisher_product_metadatatags_on_publisher_id", using: :btree
  add_index "publisher_product_metadatatags", ["publisher_product_id"], name: "index_publisher_product_metadatatags_on_publisher_product_id", using: :btree

  create_table "publisher_products", force: true do |t|
    t.integer  "publisher_id"
    t.string   "name_product",         limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "has_description",                  default: false
    t.string   "product_logo",         limit: 100
    t.boolean  "has_product_logo",                 default: false
    t.string   "product_metadata",     limit: 100
    t.boolean  "has_product_metadata",             default: false
  end

  add_index "publisher_products", ["publisher_id"], name: "index_publisher_products_on_publisher_id", using: :btree

  create_table "publisher_profiles", force: true do |t|
    t.integer  "publisher_id"
    t.string   "name_logo",    limit: 100
    t.boolean  "has_logo",                 default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_profiles", ["publisher_id"], name: "index_publisher_profiles_on_publisher_id", using: :btree

  create_table "publisher_settings", force: true do |t|
    t.integer  "publisher_id"
    t.string   "background",   limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_settings", ["publisher_id"], name: "index_publisher_settings_on_publisher_id", using: :btree

  create_table "publishers", force: true do |t|
    t.string   "name",                       limit: 100
    t.string   "address",                    limit: 100
    t.string   "city",                       limit: 100
    t.string   "state",                      limit: 50
    t.string   "country",                    limit: 100
    t.integer  "zip"
    t.string   "phone",                      limit: 100
    t.string   "url",                        limit: 100
    t.text     "description"
    t.string   "company_contact_name_first", limit: 100
    t.string   "company_contact_name_last",  limit: 100
    t.string   "company_contact_phone",      limit: 100
    t.string   "company_contact_email",      limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",           limit: 50, default: ""
    t.string   "username",        limit: 50
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "account_type",    limit: 50
    t.boolean  "has_account",                default: false
    t.string   "name_first",      limit: 50
    t.string   "name_last",       limit: 50
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
