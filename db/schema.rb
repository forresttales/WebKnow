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

ActiveRecord::Schema.define(version: 20150606031257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_states", force: true do |t|
    t.integer  "state",       default: 0
    t.string   "state_text"
    t.integer  "state_value", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_users", force: true do |t|
    t.string   "name_first"
    t.string   "name_last"
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bd_years", force: true do |t|
    t.integer  "year",       default: 0
    t.string   "year_text"
    t.integer  "year_value", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "core_literacy_standards", force: true do |t|
    t.string   "dot_not"
    t.string   "uri"
    t.string   "guid"
    t.string   "url_prev"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "core_math_standards", force: true do |t|
    t.string   "dot_not"
    t.string   "uri"
    t.string   "guid"
    t.string   "url_prev"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dtab10lets", force: true do |t|
    t.integer  "col_order"
    t.string   "col_1"
    t.string   "col_2"
    t.string   "col_3"
    t.string   "col_4"
    t.string   "col_5"
    t.string   "col_6"
    t.string   "col_7"
    t.string   "col_8"
    t.string   "col_9"
    t.string   "col_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dtab11lets", force: true do |t|
    t.integer  "col_order"
    t.string   "col_1"
    t.string   "col_2"
    t.string   "col_3"
    t.string   "col_4"
    t.string   "col_5"
    t.string   "col_6"
    t.string   "col_7"
    t.string   "col_8"
    t.string   "col_9"
    t.string   "col_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dtab12lets", force: true do |t|
    t.integer  "col_order"
    t.string   "col_1"
    t.string   "col_2"
    t.string   "col_3"
    t.string   "col_4"
    t.string   "col_5"
    t.string   "col_6"
    t.string   "col_7"
    t.string   "col_8"
    t.string   "col_9"
    t.string   "col_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dtab13lets", force: true do |t|
    t.integer  "col_order"
    t.string   "col_1"
    t.string   "col_2"
    t.string   "col_3"
    t.string   "col_4"
    t.string   "col_5"
    t.string   "col_6"
    t.string   "col_7"
    t.string   "col_8"
    t.string   "col_9"
    t.string   "col_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dtab14lets", force: true do |t|
    t.integer  "col_order"
    t.string   "col_1"
    t.string   "col_2"
    t.string   "col_3"
    t.string   "col_4"
    t.string   "col_5"
    t.string   "col_6"
    t.string   "col_7"
    t.string   "col_8"
    t.string   "col_9"
    t.string   "col_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dtab15lets", force: true do |t|
    t.integer  "col_order"
    t.string   "col_1"
    t.string   "col_2"
    t.string   "col_3"
    t.string   "col_4"
    t.string   "col_5"
    t.string   "col_6"
    t.string   "col_7"
    t.string   "col_8"
    t.string   "col_9"
    t.string   "col_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dtab16lets", force: true do |t|
    t.integer  "col_order"
    t.string   "col_1"
    t.string   "col_2"
    t.string   "col_3"
    t.string   "col_4"
    t.string   "col_5"
    t.string   "col_6"
    t.string   "col_7"
    t.string   "col_8"
    t.string   "col_9"
    t.string   "col_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dtab17lets", force: true do |t|
    t.integer  "col_order"
    t.string   "col_1"
    t.string   "col_2"
    t.string   "col_3"
    t.string   "col_4"
    t.string   "col_5"
    t.string   "col_6"
    t.string   "col_7"
    t.string   "col_8"
    t.string   "col_9"
    t.string   "col_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dtab18lets", force: true do |t|
    t.integer  "col_order"
    t.string   "col_1"
    t.string   "col_2"
    t.string   "col_3"
    t.string   "col_4"
    t.string   "col_5"
    t.string   "col_6"
    t.string   "col_7"
    t.string   "col_8"
    t.string   "col_9"
    t.string   "col_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dtab19lets", force: true do |t|
    t.integer  "col_order"
    t.string   "col_1"
    t.string   "col_2"
    t.string   "col_3"
    t.string   "col_4"
    t.string   "col_5"
    t.string   "col_6"
    t.string   "col_7"
    t.string   "col_8"
    t.string   "col_9"
    t.string   "col_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dtab1lets", force: true do |t|
    t.integer  "col_order"
    t.string   "col_1"
    t.string   "col_2"
    t.string   "col_3"
    t.string   "col_4"
    t.string   "col_5"
    t.string   "col_6"
    t.string   "col_7"
    t.string   "col_8"
    t.string   "col_9"
    t.string   "col_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dtab20lets", force: true do |t|
    t.integer  "col_order"
    t.string   "col_1"
    t.string   "col_2"
    t.string   "col_3"
    t.string   "col_4"
    t.string   "col_5"
    t.string   "col_6"
    t.string   "col_7"
    t.string   "col_8"
    t.string   "col_9"
    t.string   "col_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dtab2lets", force: true do |t|
    t.integer  "col_order"
    t.string   "col_1"
    t.string   "col_2"
    t.string   "col_3"
    t.string   "col_4"
    t.string   "col_5"
    t.string   "col_6"
    t.string   "col_7"
    t.string   "col_8"
    t.string   "col_9"
    t.string   "col_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dtab3lets", force: true do |t|
    t.integer  "col_order"
    t.string   "col_1"
    t.string   "col_2"
    t.string   "col_3"
    t.string   "col_4"
    t.string   "col_5"
    t.string   "col_6"
    t.string   "col_7"
    t.string   "col_8"
    t.string   "col_9"
    t.string   "col_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dtab4lets", force: true do |t|
    t.integer  "col_order"
    t.string   "col_1"
    t.string   "col_2"
    t.string   "col_3"
    t.string   "col_4"
    t.string   "col_5"
    t.string   "col_6"
    t.string   "col_7"
    t.string   "col_8"
    t.string   "col_9"
    t.string   "col_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dtab5lets", force: true do |t|
    t.integer  "col_order"
    t.string   "col_1"
    t.string   "col_2"
    t.string   "col_3"
    t.string   "col_4"
    t.string   "col_5"
    t.string   "col_6"
    t.string   "col_7"
    t.string   "col_8"
    t.string   "col_9"
    t.string   "col_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dtab6lets", force: true do |t|
    t.integer  "col_order"
    t.string   "col_1"
    t.string   "col_2"
    t.string   "col_3"
    t.string   "col_4"
    t.string   "col_5"
    t.string   "col_6"
    t.string   "col_7"
    t.string   "col_8"
    t.string   "col_9"
    t.string   "col_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dtab7lets", force: true do |t|
    t.integer  "col_order"
    t.string   "col_1"
    t.string   "col_2"
    t.string   "col_3"
    t.string   "col_4"
    t.string   "col_5"
    t.string   "col_6"
    t.string   "col_7"
    t.string   "col_8"
    t.string   "col_9"
    t.string   "col_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dtab8lets", force: true do |t|
    t.integer  "col_order"
    t.string   "col_1"
    t.string   "col_2"
    t.string   "col_3"
    t.string   "col_4"
    t.string   "col_5"
    t.string   "col_6"
    t.string   "col_7"
    t.string   "col_8"
    t.string   "col_9"
    t.string   "col_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dtab9lets", force: true do |t|
    t.integer  "col_order"
    t.string   "col_1"
    t.string   "col_2"
    t.string   "col_3"
    t.string   "col_4"
    t.string   "col_5"
    t.string   "col_6"
    t.string   "col_7"
    t.string   "col_8"
    t.string   "col_9"
    t.string   "col_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dtablets", force: true do |t|
    t.integer  "col_id"
    t.integer  "col_order"
    t.string   "col_1"
    t.string   "col_2"
    t.string   "col_3"
    t.string   "col_4"
    t.string   "col_5"
    t.string   "col_6"
    t.string   "col_7"
    t.string   "col_8"
    t.string   "col_9"
    t.string   "col_10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "galleries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "image_sizes", force: true do |t|
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

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

  create_table "issued_gen_ids", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "profile_type",                  default: 0
    t.integer  "profile_id",                    default: 0
    t.boolean  "has_personalized_id",           default: false
    t.string   "personalized_id"
    t.integer  "gen_id",              limit: 8
    t.integer  "user_id",             limit: 8
    t.integer  "student_id",          limit: 8
    t.integer  "teacher_id",          limit: 8
    t.integer  "publisher_id",        limit: 8
    t.integer  "institute_id",        limit: 8
    t.integer  "recruiter_id",        limit: 8
  end

  add_index "issued_gen_ids", ["gen_id"], name: "index_issued_gen_ids_on_gen_id", unique: true, using: :btree
  add_index "issued_gen_ids", ["institute_id"], name: "index_issued_gen_ids_on_institute_id", unique: true, using: :btree
  add_index "issued_gen_ids", ["publisher_id"], name: "index_issued_gen_ids_on_publisher_id", unique: true, using: :btree
  add_index "issued_gen_ids", ["recruiter_id"], name: "index_issued_gen_ids_on_recruiter_id", unique: true, using: :btree
  add_index "issued_gen_ids", ["student_id"], name: "index_issued_gen_ids_on_student_id", unique: true, using: :btree
  add_index "issued_gen_ids", ["teacher_id"], name: "index_issued_gen_ids_on_teacher_id", unique: true, using: :btree
  add_index "issued_gen_ids", ["user_id"], name: "index_issued_gen_ids_on_user_id", unique: true, using: :btree

  create_table "issued_per_ids", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "id_per"
    t.integer  "profile_type", default: 0
    t.integer  "profile_id",   default: 0
  end

  add_index "issued_per_ids", ["id_per"], name: "index_issued_per_ids_on_id_per", using: :btree

  create_table "issued_publisher_product_ids", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_product_gen_id", limit: 8
    t.integer  "publisher_product_id"
    t.integer  "publisher_id"
  end

  add_index "issued_publisher_product_ids", ["publisher_product_gen_id"], name: "index_issued_publisher_product_id_on_publisher_product_id", unique: true, using: :btree

  create_table "journal1poster_positions", force: true do |t|
    t.integer  "id_map"
    t.integer  "pos_x",        default: 0
    t.integer  "pos_y",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "section",      default: 0
    t.string   "section_text"
    t.integer  "section_pos",  default: 0
  end

  add_index "journal1poster_positions", ["id_map"], name: "index_journal1poster_positions_on_id_map", using: :btree

  create_table "journal1posters", force: true do |t|
    t.integer  "id_user"
    t.integer  "publisher_id"
    t.integer  "publisher_journalposter_id"
    t.integer  "map_position",               default: 0
    t.integer  "id_final"
    t.string   "url"
    t.string   "main_sales_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "journal1posters", ["publisher_id"], name: "index_journal1posters_on_publisher_id", using: :btree
  add_index "journal1posters", ["publisher_journalposter_id"], name: "index_journal1posters_on_publisher_journalposter_id", using: :btree

  create_table "journal2poster_positions", force: true do |t|
    t.integer  "id_map"
    t.integer  "pos_x",        default: 0
    t.integer  "pos_y",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "section",      default: 0
    t.string   "section_text"
    t.integer  "section_pos",  default: 0
  end

  add_index "journal2poster_positions", ["id_map"], name: "index_journal2poster_positions_on_id_map", using: :btree

  create_table "journal2posters", force: true do |t|
    t.integer  "id_user"
    t.integer  "publisher_id"
    t.integer  "publisher_journalposter_id"
    t.integer  "map_position",               default: 0
    t.integer  "id_final"
    t.string   "url"
    t.string   "main_sales_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "journal2posters", ["publisher_id"], name: "index_journal2posters_on_publisher_id", using: :btree
  add_index "journal2posters", ["publisher_journalposter_id"], name: "index_journal2posters_on_publisher_journalposter_id", using: :btree

  create_table "journal3poster_positions", force: true do |t|
    t.integer  "id_map"
    t.integer  "pos_x",        default: 0
    t.integer  "pos_y",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "section",      default: 0
    t.string   "section_text"
    t.integer  "section_pos",  default: 0
  end

  add_index "journal3poster_positions", ["id_map"], name: "index_journal3poster_positions_on_id_map", using: :btree

  create_table "journal3posters", force: true do |t|
    t.integer  "id_user"
    t.integer  "publisher_id"
    t.integer  "publisher_journalposter_id"
    t.integer  "map_position",               default: 0
    t.integer  "id_final"
    t.string   "url"
    t.string   "main_sales_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "journal3posters", ["publisher_id"], name: "index_journal3posters_on_publisher_id", using: :btree
  add_index "journal3posters", ["publisher_journalposter_id"], name: "index_journal3posters_on_publisher_journalposter_id", using: :btree

  create_table "journal4poster_positions", force: true do |t|
    t.integer  "id_map"
    t.integer  "pos_x",        default: 0
    t.integer  "pos_y",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "section",      default: 0
    t.string   "section_text"
    t.integer  "section_pos",  default: 0
  end

  add_index "journal4poster_positions", ["id_map"], name: "index_journal4poster_positions_on_id_map", using: :btree

  create_table "journal4posters", force: true do |t|
    t.integer  "id_user"
    t.integer  "publisher_id"
    t.integer  "publisher_journalposter_id"
    t.integer  "map_position",               default: 0
    t.integer  "id_final"
    t.string   "url"
    t.string   "main_sales_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "journal4posters", ["publisher_id"], name: "index_journal4posters_on_publisher_id", using: :btree
  add_index "journal4posters", ["publisher_journalposter_id"], name: "index_journal4posters_on_publisher_journalposter_id", using: :btree

  create_table "journal5poster_positions", force: true do |t|
    t.integer  "id_map"
    t.integer  "pos_x",        default: 0
    t.integer  "pos_y",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "section",      default: 0
    t.string   "section_text"
    t.integer  "section_pos",  default: 0
  end

  add_index "journal5poster_positions", ["id_map"], name: "index_journal5poster_positions_on_id_map", using: :btree

  create_table "journal5posters", force: true do |t|
    t.integer  "id_user"
    t.integer  "publisher_id"
    t.integer  "publisher_journalposter_id"
    t.integer  "map_position",               default: 0
    t.integer  "id_final"
    t.string   "url"
    t.string   "main_sales_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "journal5posters", ["publisher_id"], name: "index_journal5posters_on_publisher_id", using: :btree
  add_index "journal5posters", ["publisher_journalposter_id"], name: "index_journal5posters_on_publisher_journalposter_id", using: :btree

  create_table "journalposter_sections", force: true do |t|
    t.integer  "id_map"
    t.integer  "section",      default: 0
    t.string   "section_text"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.decimal  "price",       precision: 5, scale: 2
  end

  create_table "log_available_posters", force: true do |t|
    t.integer  "id_map"
    t.boolean  "closed",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "log_errors", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "profile_index",       default: 0
    t.string   "profile_description"
    t.string   "description"
    t.string   "controller"
    t.string   "action"
  end

  create_table "log_publishers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_id"
    t.integer  "user_id"
  end

  add_index "log_publishers", ["publisher_id"], name: "index_log_publishers_on_publisher_id", using: :btree
  add_index "log_publishers", ["user_id"], name: "index_log_publishers_on_user_id", using: :btree

  create_table "log_users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "log_users", ["user_id"], name: "index_log_users_on_user_id", using: :btree

  create_table "paintings", force: true do |t|
    t.integer  "gallery_id"
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_publisher_comments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_publisher_id"
    t.integer  "publisher_id"
    t.integer  "user_id"
    t.text     "comment_text",      default: ""
  end

  add_index "post_publisher_comments", ["post_publisher_id"], name: "index_post_publisher_comments_on_post_publisher_id", using: :btree
  add_index "post_publisher_comments", ["publisher_id"], name: "index_post_publisher_comments_on_publisher_id", using: :btree
  add_index "post_publisher_comments", ["user_id"], name: "index_post_publisher_comments_on_user_id", using: :btree

  create_table "post_publisher_images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_publisher_id", default: 0
    t.integer  "publisher_id",      default: 0
    t.integer  "user_id",           default: 0
    t.string   "image"
    t.string   "image_name"
    t.boolean  "primary",           default: false
    t.integer  "order",             default: 0
    t.integer  "crop_x",            default: 0
    t.integer  "crop_y",            default: 0
    t.integer  "crop_w",            default: 0
    t.integer  "crop_h",            default: 0
  end

  add_index "post_publisher_images", ["post_publisher_id"], name: "index_post_publisher_images_on_post_publisher_id", using: :btree
  add_index "post_publisher_images", ["publisher_id"], name: "index_post_publisher_images_on_publisher_id", using: :btree
  add_index "post_publisher_images", ["user_id"], name: "index_post_publisher_images_on_user_id", using: :btree

  create_table "post_publisher_likes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_publisher_id"
    t.integer  "user_id"
  end

  add_index "post_publisher_likes", ["post_publisher_id"], name: "index_post_publisher_likes_on_post_publisher_id", using: :btree
  add_index "post_publisher_likes", ["user_id"], name: "index_post_publisher_likes_on_user_id", using: :btree

  create_table "post_publishers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "publisher_id"
    t.text     "post_text",    default: ""
    t.boolean  "b_group",      default: false
  end

  add_index "post_publishers", ["publisher_id"], name: "index_post_publishers_on_publisher_id", using: :btree
  add_index "post_publishers", ["user_id"], name: "index_post_publishers_on_user_id", using: :btree

  create_table "post_user_comments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_user_id"
    t.integer  "user_id"
    t.text     "comment_text", default: ""
  end

  add_index "post_user_comments", ["post_user_id"], name: "index_post_user_comments_on_post_user_id", using: :btree
  add_index "post_user_comments", ["user_id"], name: "index_post_user_comments_on_user_id", using: :btree

  create_table "post_user_images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",      default: 0
    t.integer  "post_user_id", default: 0
    t.string   "image"
    t.string   "image_name"
    t.boolean  "primary",      default: false
    t.integer  "order",        default: 0
    t.integer  "crop_x",       default: 0
    t.integer  "crop_y",       default: 0
    t.integer  "crop_w",       default: 0
    t.integer  "crop_h",       default: 0
  end

  add_index "post_user_images", ["post_user_id"], name: "index_post_user_images_on_post_user_id", using: :btree

  create_table "post_user_likes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_user_id"
    t.integer  "user_id"
  end

  add_index "post_user_likes", ["post_user_id"], name: "index_post_user_likes_on_post_user_id", using: :btree
  add_index "post_user_likes", ["user_id"], name: "index_post_user_likes_on_user_id", using: :btree

  create_table "post_users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.text     "post_text",  default: ""
    t.boolean  "b_group",    default: false
  end

  add_index "post_users", ["user_id"], name: "index_post_users_on_user_id", using: :btree

  create_table "public_publisher_admins", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "public_publisher_users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "public_publishers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "public_users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publisher_ad_listings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                                      default: 0
    t.integer  "publisher_id",                                 default: 0
    t.integer  "publisher_product_id",                         default: 0
    t.decimal  "ad_amount",            precision: 8, scale: 2, default: 0.0
    t.string   "name_product"
    t.integer  "term_listing",                                 default: 0
    t.integer  "term_positioning",                             default: 0
    t.integer  "term_keyword",                                 default: 0
    t.string   "keyword"
    t.decimal  "cost_listing",         precision: 8, scale: 2, default: 0.0
    t.decimal  "cost_positioning",     precision: 8, scale: 2, default: 0.0
    t.decimal  "cost_keyword",         precision: 8, scale: 2, default: 0.0
    t.datetime "ad_date_exp"
    t.datetime "ad_date_init"
  end

  add_index "publisher_ad_listings", ["publisher_id"], name: "index_publisher_ad_listings_on_publisher_id", using: :btree

  create_table "publisher_ad_pins", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                                      default: 0
    t.integer  "publisher_id",                                 default: 0
    t.integer  "publisher_product_id",                         default: 0
    t.decimal  "ad_amount",            precision: 8, scale: 2, default: 0.0
    t.string   "name_product"
    t.string   "poster"
    t.integer  "poster_index",                                 default: 0
    t.string   "category"
    t.integer  "category_index",                               default: 0
    t.integer  "term_pin",                                     default: 0
    t.datetime "ad_date_exp"
    t.datetime "ad_date_init"
  end

  add_index "publisher_ad_pins", ["publisher_id"], name: "index_publisher_ad_pins_on_publisher_id", using: :btree

  create_table "publisher_ad_squares", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                                      default: 0
    t.integer  "publisher_id",                                 default: 0
    t.integer  "publisher_product_id",                         default: 0
    t.decimal  "ad_amount",            precision: 8, scale: 2, default: 0.0
    t.string   "name_product"
    t.string   "poster"
    t.integer  "poster_index",                                 default: 0
    t.integer  "term_square",                                  default: 0
    t.string   "keyword"
    t.decimal  "cost_keyword",         precision: 8, scale: 2, default: 0.0
    t.datetime "ad_date_exp"
    t.datetime "ad_date_init"
  end

  add_index "publisher_ad_squares", ["publisher_id"], name: "index_publisher_ad_squares_on_publisher_id", using: :btree

  create_table "publisher_admin_settings", force: true do |t|
    t.integer  "user_id"
    t.integer  "publisher_id"
    t.string   "background"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_admin_settings", ["publisher_id"], name: "index_publisher_admin_settings_on_publisher_id", using: :btree
  add_index "publisher_admin_settings", ["user_id"], name: "index_publisher_admin_settings_on_user_id", using: :btree

  create_table "publisher_ads", force: true do |t|
    t.integer  "user_id"
    t.integer  "publisher_id"
    t.string   "ad_name"
    t.string   "ad_subject"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ad_index",                                       default: 0
    t.string   "ad_description"
    t.boolean  "ad_status_purchased",                            default: false
    t.boolean  "ad_status_public",                               default: false
    t.datetime "ad_date_exp"
    t.datetime "ad_date_init"
    t.decimal  "ad_amount",              precision: 8, scale: 2, default: 0.0
    t.integer  "ad_status_public_index",                         default: 0
    t.string   "ad_status_public_msg"
    t.string   "auth_code"
    t.integer  "publisher_product_id",                           default: 0
  end

  add_index "publisher_ads", ["publisher_id"], name: "index_publisher_ads_on_publisher_id", using: :btree

  create_table "publisher_images", force: true do |t|
    t.integer  "publisher_id"
    t.string   "image_name",   limit: 100
    t.boolean  "primary",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_images", ["publisher_id"], name: "index_publisher_images_on_publisher_id", using: :btree

  create_table "publisher_journalposter_descriptions", force: true do |t|
    t.integer  "publisher_journalposter_id"
    t.integer  "publisher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "poster"
    t.string   "poster_text"
    t.string   "logo"
    t.text     "tag_line"
    t.string   "headline"
    t.string   "screen_shot"
    t.string   "main_sales_phone"
    t.integer  "curriculum_resources"
    t.string   "curriculum_resources_text"
    t.integer  "teacher_tools"
    t.string   "teacher_tools_text"
    t.integer  "school_operations"
    t.string   "school_operations_text"
    t.integer  "content"
    t.string   "content_text"
    t.integer  "prof_learning"
    t.string   "prof_learning_text"
    t.integer  "cent21_learning"
    t.string   "cent21_learning_text"
    t.integer  "language"
    t.string   "language_text"
    t.integer  "math"
    t.string   "math_text"
    t.integer  "science"
    t.string   "science_text"
    t.integer  "social_studies"
    t.string   "social_studies_text"
    t.integer  "special_ed"
    t.string   "special_ed_text"
    t.integer  "assmt_testing"
    t.string   "assmt_testing_text"
    t.integer  "collaboration"
    t.string   "collaboration_text"
    t.integer  "classroom_resp"
    t.string   "classroom_resp_text"
    t.integer  "grading_atten"
    t.string   "grading_atten_text"
    t.integer  "lesson_planning"
    t.string   "lesson_planning_text"
    t.integer  "pres_tools"
    t.string   "pres_tools_text"
    t.integer  "lecture_capture"
    t.string   "lecture_capture_text"
    t.integer  "plag_checks"
    t.string   "plag_checks_text"
    t.integer  "learning_mgmt_systs"
    t.string   "learning_mgmt_systs_text"
    t.integer  "student_info_systs"
    t.string   "student_info_systs_text"
    t.integer  "web_filtering"
    t.string   "web_filtering_text"
    t.integer  "device_mgmt"
    t.string   "device_mgmt_text"
    t.integer  "virtual_dist_ed"
    t.string   "virtual_dist_ed_text"
    t.integer  "testing_systs"
    t.string   "testing_systs_text"
    t.integer  "unique_tech"
    t.string   "unique_tech_text"
    t.integer  "apps"
    t.string   "apps_text"
    t.integer  "digit_textbooks"
    t.string   "digit_textbooks_text"
    t.integer  "games"
    t.string   "games_text"
    t.integer  "study_tools"
    t.string   "study_tools_text"
    t.integer  "video"
    t.string   "video_text"
    t.integer  "dictionaries"
    t.string   "dictionaries_text"
    t.integer  "directories"
    t.string   "directories_text"
    t.integer  "subscrip_sites"
    t.string   "subscrip_sites_text"
    t.integer  "ebook_game_creat"
    t.string   "ebook_game_creat_text"
    t.integer  "digit_story_poster"
    t.string   "digit_story_poster_text"
    t.integer  "courseware"
    t.string   "courseware_text"
    t.integer  "talent_mgmt"
    t.string   "talent_mgmt_text"
    t.integer  "prof_devel_systems"
    t.string   "prof_devel_systems_text"
    t.integer  "instr_design"
    t.string   "instr_design_text"
    t.integer  "other_diy"
    t.string   "other_diy_text"
    t.text     "word_descr"
    t.string   "url"
  end

  add_index "publisher_journalposter_descriptions", ["publisher_journalposter_id"], name: "publisher_id_journalposter_id", unique: true, using: :btree

  create_table "publisher_journalposter_images", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_journalposter_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publisher_journalposter_logos", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_journalposter_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_journalposter_logos", ["publisher_journalposter_id"], name: "publisher_id_journalposter_logo_id", unique: true, using: :btree

  create_table "publisher_journalposter_metadatatags", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_journalposter_id"
    t.string   "name_metadata"
    t.text     "text_metadata"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publisher_journalposter_prodshots", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_journalposter_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_journalposter_prodshots", ["publisher_journalposter_id"], name: "publisher_id_journalposter_prodshot_id", unique: true, using: :btree

  create_table "publisher_journalposter_purchases", force: true do |t|
    t.integer  "id_user"
    t.integer  "publisher_id"
    t.integer  "publisher_journalposter_id"
    t.text     "message"
    t.integer  "price"
    t.integer  "price_owed"
    t.integer  "price_paid"
    t.integer  "price_refund"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publisher_journalposters", force: true do |t|
    t.integer  "publisher_id"
    t.string   "name_journalposter"
    t.boolean  "has_description",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "journalposter_logo"
    t.string   "journalposter_metadata"
    t.integer  "poster"
    t.string   "poster_text"
    t.boolean  "has_journalposter_logo",     default: false
    t.boolean  "has_journalposter_prodshot", default: false
    t.boolean  "has_journalposter_metadata", default: false
    t.boolean  "has_purchase",               default: false
    t.datetime "purchase_date"
    t.integer  "poster_type",                default: 0
    t.integer  "poster_coord_id",            default: 0
    t.integer  "id_map",                     default: 0
    t.integer  "area",                       default: 0
    t.integer  "area_pos",                   default: 0
  end

  add_index "publisher_journalposters", ["publisher_id"], name: "index_publisher_journalposters_on_publisher_id", using: :btree

  create_table "publisher_logo_images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",      default: 0
    t.integer  "publisher_id", default: 0
    t.string   "image"
    t.string   "image_name"
    t.boolean  "primary",      default: false
    t.integer  "order",        default: 0
    t.integer  "crop_x",       default: 0
    t.integer  "crop_y",       default: 0
    t.integer  "crop_w",       default: 0
    t.integer  "crop_h",       default: 0
    t.integer  "width",        default: 0
    t.integer  "height",       default: 0
  end

  add_index "publisher_logo_images", ["publisher_id"], name: "index_publisher_logo_images_on_publisher_id", using: :btree

  create_table "publisher_members", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",           default: 0
    t.integer  "publisher_id",      default: 0
    t.integer  "publisher_user_id", default: 0
  end

  add_index "publisher_members", ["publisher_id"], name: "index_publisher_members_on_publisher_id", using: :btree

  create_table "publisher_metrics", force: true do |t|
    t.integer  "user_id"
    t.string   "name_metric"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_metrics", ["user_id"], name: "index_publisher_metrics_on_user_id", using: :btree

  create_table "publisher_plot_images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_plot_id", default: 0
    t.integer  "publisher_id",      default: 0
    t.integer  "publisher_user_id", default: 0
    t.integer  "user_id",           default: 0
    t.string   "image"
    t.string   "image_name"
    t.boolean  "primary",           default: false
    t.integer  "order",             default: 0
    t.integer  "crop_x",            default: 0
    t.integer  "crop_y",            default: 0
    t.integer  "crop_w",            default: 0
    t.integer  "crop_h",            default: 0
  end

  add_index "publisher_plot_images", ["publisher_plot_id"], name: "index_publisher_plot_images_on_publisher_plot_id", using: :btree

  create_table "publisher_plots", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_id"
    t.integer  "publisher_user_id"
    t.integer  "user_id"
    t.text     "plot_text",         default: "<br>"
  end

  add_index "publisher_plots", ["publisher_id"], name: "index_publisher_plots_on_publisher_id", using: :btree
  add_index "publisher_plots", ["publisher_user_id"], name: "index_publisher_plots_on_publisher_user_id", using: :btree
  add_index "publisher_plots", ["user_id"], name: "index_publisher_plots_on_user_id", using: :btree

  create_table "publisher_poster_pins", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_poster_pins", ["publisher_id"], name: "index_publisher_poster_pins_on_publisher_id", using: :btree
  add_index "publisher_poster_pins", ["publisher_id"], name: "poster_pins_on_publisher_id", using: :btree
  add_index "publisher_poster_pins", ["publisher_product_id"], name: "index_publisher_poster_pins_on_publisher_product_id", using: :btree
  add_index "publisher_poster_pins", ["publisher_product_id"], name: "poster_pins_on_publisher_product_id", using: :btree

  create_table "publisher_poster_premium_positions", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publisher_poster_squares", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_poster_squares", ["publisher_id"], name: "index_publisher_poster_squares_on_publisher_id", using: :btree
  add_index "publisher_poster_squares", ["publisher_product_id"], name: "index_publisher_poster_squares_on_publisher_product_id", using: :btree

  create_table "publisher_posters", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.string   "name_poster"
    t.boolean  "has_description"
    t.boolean  "has_image_logo"
    t.boolean  "has_image_prodshot"
    t.boolean  "poster_free"
    t.boolean  "has_purchase"
    t.datetime "date_purchase"
    t.integer  "poster_type"
    t.integer  "id_map"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_posters", ["publisher_id"], name: "index_publisher_posters_on_publisher_id", using: :btree
  add_index "publisher_posters", ["publisher_product_id"], name: "index_publisher_posters_on_publisher_product_id", using: :btree

  create_table "publisher_privileges", force: true do |t|
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "user_id"
    t.integer  "publisher_user_id"
    t.integer  "publisher_id"
    t.boolean  "level_1",           default: false
    t.boolean  "level_2",           default: false
    t.boolean  "level_3",           default: false
  end

  add_index "publisher_privileges", ["publisher_id"], name: "index_publisher_privileges_on_publisher_id", using: :btree
  add_index "publisher_privileges", ["publisher_user_id"], name: "index_publisher_privileges_on_publisher_user_id", using: :btree

  create_table "publisher_product1_images", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_product1_images", ["publisher_id"], name: "index_publisher_product1_images_on_publisher_id", using: :btree
  add_index "publisher_product1_images", ["publisher_product_id"], name: "index_publisher_product1_images_on_publisher_product_id", using: :btree

  create_table "publisher_product2_images", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_product2_images", ["publisher_id"], name: "index_publisher_product2_images_on_publisher_id", using: :btree
  add_index "publisher_product2_images", ["publisher_product_id"], name: "index_publisher_product2_images_on_publisher_product_id", using: :btree

  create_table "publisher_product_appropriate_ages", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.boolean  "age_appropriate_1",     default: false
    t.boolean  "age_appropriate_2",     default: false
    t.boolean  "age_appropriate_3",     default: false
    t.boolean  "age_appropriate_4",     default: false
    t.boolean  "age_appropriate_5",     default: false
    t.boolean  "age_appropriate_6",     default: false
    t.boolean  "age_appropriate_7",     default: false
    t.boolean  "age_appropriate_8",     default: false
    t.boolean  "age_appropriate_9",     default: false
    t.boolean  "age_appropriate_10",    default: false
    t.boolean  "age_appropriate_11",    default: false
    t.boolean  "age_appropriate_12",    default: false
    t.boolean  "age_appropriate_13",    default: false
    t.boolean  "age_appropriate_14",    default: false
    t.boolean  "age_appropriate_15",    default: false
    t.boolean  "age_appropriate_16",    default: false
    t.boolean  "age_appropriate_17",    default: false
    t.boolean  "age_appropriate_adult", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_product_appropriate_ages", ["publisher_id"], name: "index_appr_age_on_publisher_id", using: :btree
  add_index "publisher_product_appropriate_ages", ["publisher_product_id"], name: "index_appr_age_on_publisher_product_id", using: :btree

  create_table "publisher_product_appropriate_grades", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.integer  "publisher_product_description_id"
    t.boolean  "grade_appropriate_1",              default: false
    t.boolean  "grade_appropriate_2",              default: false
    t.boolean  "grade_appropriate_3",              default: false
    t.boolean  "grade_appropriate_4",              default: false
    t.boolean  "grade_appropriate_5",              default: false
    t.boolean  "grade_appropriate_6",              default: false
    t.boolean  "grade_appropriate_7",              default: false
    t.boolean  "grade_appropriate_8",              default: false
    t.boolean  "grade_appropriate_9",              default: false
    t.boolean  "grade_appropriate_10",             default: false
    t.boolean  "grade_appropriate_11",             default: false
    t.boolean  "grade_appropriate_12",             default: false
    t.boolean  "grade_appropriate_13",             default: false
    t.boolean  "grade_appropriate_14",             default: false
    t.boolean  "grade_appropriate_15",             default: false
    t.boolean  "grade_appropriate_16",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_product_appropriate_grades", ["publisher_id"], name: "index_appr_grade_on_publisher_id", using: :btree
  add_index "publisher_product_appropriate_grades", ["publisher_product_id"], name: "index_appr_grade_on_publisher_product_id", using: :btree

  create_table "publisher_product_by_reviews", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.boolean  "by_review_1",          default: false
    t.string   "by_review_1_text"
    t.boolean  "by_review_2",          default: false
    t.string   "by_review_2_text"
    t.boolean  "by_review_3",          default: false
    t.string   "by_review_3_text"
    t.boolean  "by_review_4",          default: false
    t.string   "by_review_4_text"
    t.boolean  "by_review_5",          default: false
    t.string   "by_review_5_text"
    t.boolean  "by_review_6",          default: false
    t.string   "by_review_6_text"
    t.boolean  "by_review_7",          default: false
    t.string   "by_review_7_text"
    t.boolean  "by_review_8",          default: false
    t.string   "by_review_8_text"
    t.boolean  "by_review_9",          default: false
    t.string   "by_review_9_text"
    t.boolean  "by_review_10",         default: false
    t.string   "by_review_10_text"
    t.boolean  "by_review_11",         default: false
    t.string   "by_review_11_text"
    t.boolean  "by_review_12",         default: false
    t.string   "by_review_12_text"
    t.boolean  "by_review_13",         default: false
    t.string   "by_review_13_text"
    t.boolean  "by_review_14",         default: false
    t.string   "by_review_14_text"
    t.boolean  "by_review_15",         default: false
    t.string   "by_review_15_text"
    t.boolean  "by_review_16",         default: false
    t.string   "by_review_16_text"
    t.boolean  "by_review_17",         default: false
    t.string   "by_review_17_text"
    t.boolean  "by_review_18",         default: false
    t.string   "by_review_18_text"
    t.boolean  "by_review_19",         default: false
    t.string   "by_review_19_text"
    t.boolean  "by_review_20",         default: false
    t.string   "by_review_20_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "by_review_other_b",    default: false
    t.string   "by_review_other"
  end

  add_index "publisher_product_by_reviews", ["publisher_id"], name: "index_by_review_on_publisher_id", using: :btree
  add_index "publisher_product_by_reviews", ["publisher_product_id"], name: "index_by_review_on_publisher_product_id", using: :btree

  create_table "publisher_product_category_subjects", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.boolean  "category_subject_1",       default: false
    t.boolean  "category_subject_2",       default: false
    t.boolean  "category_subject_3",       default: false
    t.boolean  "category_subject_4",       default: false
    t.boolean  "category_subject_5",       default: false
    t.boolean  "category_subject_6",       default: false
    t.boolean  "category_subject_7",       default: false
    t.boolean  "category_subject_8",       default: false
    t.boolean  "category_subject_9",       default: false
    t.boolean  "category_subject_10",      default: false
    t.boolean  "category_subject_11",      default: false
    t.boolean  "category_subject_12",      default: false
    t.boolean  "category_subject_13",      default: false
    t.boolean  "category_subject_14",      default: false
    t.boolean  "category_subject_15",      default: false
    t.boolean  "category_subject_16",      default: false
    t.boolean  "category_subject_17",      default: false
    t.boolean  "category_subject_18",      default: false
    t.boolean  "category_subject_19",      default: false
    t.boolean  "category_subject_20",      default: false
    t.boolean  "category_subject_21",      default: false
    t.boolean  "category_subject_22",      default: false
    t.boolean  "category_subject_23",      default: false
    t.boolean  "category_subject_24",      default: false
    t.boolean  "category_subject_25",      default: false
    t.boolean  "category_subject_26",      default: false
    t.boolean  "category_subject_27",      default: false
    t.boolean  "category_subject_28",      default: false
    t.boolean  "category_subject_29",      default: false
    t.boolean  "category_subject_30",      default: false
    t.boolean  "category_subject_31",      default: false
    t.boolean  "category_subject_32",      default: false
    t.boolean  "category_subject_33",      default: false
    t.boolean  "category_subject_34",      default: false
    t.boolean  "category_subject_35",      default: false
    t.boolean  "category_subject_36",      default: false
    t.boolean  "category_subject_37",      default: false
    t.boolean  "category_subject_38",      default: false
    t.boolean  "category_subject_39",      default: false
    t.boolean  "category_subject_40",      default: false
    t.boolean  "category_subject_41",      default: false
    t.boolean  "category_subject_42",      default: false
    t.boolean  "category_subject_43",      default: false
    t.boolean  "category_subject_44",      default: false
    t.boolean  "category_subject_45",      default: false
    t.boolean  "category_subject_46",      default: false
    t.boolean  "category_subject_47",      default: false
    t.boolean  "category_subject_48",      default: false
    t.boolean  "category_subject_49",      default: false
    t.boolean  "category_subject_50",      default: false
    t.boolean  "category_subject_51",      default: false
    t.boolean  "category_subject_52",      default: false
    t.boolean  "category_subject_53",      default: false
    t.boolean  "category_subject_54",      default: false
    t.boolean  "category_subject_55",      default: false
    t.boolean  "category_subject_56",      default: false
    t.boolean  "category_subject_57",      default: false
    t.boolean  "category_subject_58",      default: false
    t.boolean  "category_subject_59",      default: false
    t.boolean  "category_subject_60",      default: false
    t.boolean  "category_subject_61",      default: false
    t.boolean  "category_subject_62",      default: false
    t.boolean  "category_subject_63",      default: false
    t.boolean  "category_subject_64",      default: false
    t.boolean  "category_subject_65",      default: false
    t.boolean  "category_subject_66",      default: false
    t.boolean  "category_subject_67",      default: false
    t.boolean  "category_subject_68",      default: false
    t.boolean  "category_subject_69",      default: false
    t.boolean  "category_subject_70",      default: false
    t.string   "category_subject_other"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "category_subject_other_b", default: false
  end

  add_index "publisher_product_category_subjects", ["publisher_id"], name: "index_category_subject_on_publisher_id", using: :btree
  add_index "publisher_product_category_subjects", ["publisher_product_id"], name: "index_category_subject_on_publisher_product_id", using: :btree

  create_table "publisher_product_characters", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.boolean  "character_1",          default: false
    t.boolean  "character_2",          default: false
    t.boolean  "character_3",          default: false
    t.boolean  "character_4",          default: false
    t.boolean  "character_5",          default: false
    t.boolean  "character_6",          default: false
    t.boolean  "character_7",          default: false
    t.boolean  "character_8",          default: false
    t.boolean  "character_9",          default: false
    t.boolean  "character_10",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_product_characters", ["publisher_id"], name: "index_character_on_publisher_id", using: :btree
  add_index "publisher_product_characters", ["publisher_product_id"], name: "index_character_on_publisher_product_id", using: :btree

  create_table "publisher_product_content_types", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.boolean  "content_type_1",       default: false
    t.boolean  "content_type_2",       default: false
    t.boolean  "content_type_3",       default: false
    t.boolean  "content_type_4",       default: false
    t.boolean  "content_type_5",       default: false
    t.boolean  "content_type_6",       default: false
    t.boolean  "content_type_7",       default: false
    t.boolean  "content_type_8",       default: false
    t.boolean  "content_type_9",       default: false
    t.boolean  "content_type_10",      default: false
    t.boolean  "content_type_11",      default: false
    t.boolean  "content_type_12",      default: false
    t.boolean  "content_type_13",      default: false
    t.boolean  "content_type_14",      default: false
    t.boolean  "content_type_15",      default: false
    t.boolean  "content_type_16",      default: false
    t.boolean  "content_type_17",      default: false
    t.boolean  "content_type_18",      default: false
    t.boolean  "content_type_19",      default: false
    t.boolean  "content_type_20",      default: false
    t.string   "content_type_other"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "content_type_other_b", default: false
  end

  add_index "publisher_product_content_types", ["publisher_id"], name: "index_content_type_on_publisher_id", using: :btree
  add_index "publisher_product_content_types", ["publisher_product_id"], name: "index_content_type_on_publisher_product_id", using: :btree

  create_table "publisher_product_core_literacy_standards", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.string   "dot_not"
    t.string   "uri"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "id_standard",          default: 0
  end

  add_index "publisher_product_core_literacy_standards", ["publisher_id"], name: "index_cls_on_publisher_id", using: :btree
  add_index "publisher_product_core_literacy_standards", ["publisher_product_id"], name: "index_cls_on_publisher_product_id", using: :btree

  create_table "publisher_product_core_math_standards", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.string   "dot_not"
    t.string   "uri"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "id_standard",          default: 0
  end

  add_index "publisher_product_core_math_standards", ["publisher_id"], name: "index_cms_on_publisher_id", using: :btree
  add_index "publisher_product_core_math_standards", ["publisher_product_id"], name: "index_cms_on_publisher_product_id", using: :btree

  create_table "publisher_product_corporate_logos", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_product_corporate_logos", ["publisher_id"], name: "index_publisher_product_corporate_logos_on_publisher_id", using: :btree
  add_index "publisher_product_corporate_logos", ["publisher_product_id"], name: "index_publisher_product_corporate_logos_on_publisher_product_id", using: :btree

  create_table "publisher_product_currents", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_id"
    t.integer  "user_id"
    t.integer  "current_publisher_product_id",               default: 0
    t.integer  "current_publisher_product_gen_id", limit: 8, default: 0
  end

  add_index "publisher_product_currents", ["publisher_id"], name: "index_publisher_product_currents_on_publisher_id", using: :btree

  create_table "publisher_product_descriptions", force: true do |t|
    t.integer  "publisher_product_id"
    t.integer  "publisher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description_text",     default: ""
  end

  add_index "publisher_product_descriptions", ["publisher_id"], name: "index_publisher_product_descriptions_on_publisher_id", using: :btree
  add_index "publisher_product_descriptions", ["publisher_product_id"], name: "index_on_publisher_product_descriptions_on_publisher_product_id", using: :btree

  create_table "publisher_product_enhancements", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.boolean  "enhancement_1",        default: false
    t.boolean  "enhancement_2",        default: false
    t.boolean  "enhancement_3",        default: false
    t.boolean  "enhancement_4",        default: false
    t.boolean  "enhancement_5",        default: false
    t.boolean  "enhancement_6",        default: false
    t.boolean  "enhancement_7",        default: false
    t.boolean  "enhancement_8",        default: false
    t.boolean  "enhancement_9",        default: false
    t.boolean  "enhancement_10",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enhancement_11",       default: false
    t.boolean  "enhancement_12",       default: false
    t.boolean  "enhancement_13",       default: false
    t.boolean  "enhancement_14",       default: false
    t.boolean  "enhancement_15",       default: false
    t.boolean  "enhancement_16",       default: false
    t.boolean  "enhancement_17",       default: false
    t.boolean  "enhancement_18",       default: false
    t.boolean  "enhancement_19",       default: false
    t.boolean  "enhancement_20",       default: false
    t.boolean  "enhancement_other_b",  default: false
    t.string   "enhancement_other"
  end

  add_index "publisher_product_enhancements", ["publisher_id"], name: "index_enhancement_on_publisher_id", using: :btree
  add_index "publisher_product_enhancements", ["publisher_product_id"], name: "index_enhancement_on_publisher_product_id", using: :btree

  create_table "publisher_product_file_types", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.boolean  "file_type_1",          default: false
    t.boolean  "file_type_2",          default: false
    t.boolean  "file_type_3",          default: false
    t.boolean  "file_type_4",          default: false
    t.boolean  "file_type_5",          default: false
    t.boolean  "file_type_6",          default: false
    t.boolean  "file_type_7",          default: false
    t.boolean  "file_type_8",          default: false
    t.boolean  "file_type_9",          default: false
    t.boolean  "file_type_10",         default: false
    t.boolean  "file_type_11",         default: false
    t.boolean  "file_type_12",         default: false
    t.boolean  "file_type_13",         default: false
    t.boolean  "file_type_14",         default: false
    t.boolean  "file_type_15",         default: false
    t.boolean  "file_type_16",         default: false
    t.boolean  "file_type_17",         default: false
    t.boolean  "file_type_18",         default: false
    t.boolean  "file_type_19",         default: false
    t.boolean  "file_type_20",         default: false
    t.boolean  "file_type_21",         default: false
    t.boolean  "file_type_22",         default: false
    t.boolean  "file_type_23",         default: false
    t.boolean  "file_type_24",         default: false
    t.boolean  "file_type_25",         default: false
    t.boolean  "file_type_26",         default: false
    t.boolean  "file_type_27",         default: false
    t.boolean  "file_type_28",         default: false
    t.boolean  "file_type_29",         default: false
    t.boolean  "file_type_30",         default: false
    t.string   "file_type_other"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "file_type_other_b",    default: false
  end

  add_index "publisher_product_file_types", ["publisher_id"], name: "index_file_type_on_publisher_id", using: :btree
  add_index "publisher_product_file_types", ["publisher_product_id"], name: "index_file_type_on_publisher_product_id", using: :btree

  create_table "publisher_product_from_ages", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.boolean  "age_1",                default: false
    t.boolean  "age_2",                default: false
    t.boolean  "age_3",                default: false
    t.boolean  "age_4",                default: false
    t.boolean  "age_5",                default: false
    t.boolean  "age_6",                default: false
    t.boolean  "age_7",                default: false
    t.boolean  "age_8",                default: false
    t.boolean  "age_9",                default: false
    t.boolean  "age_10",               default: false
    t.boolean  "age_11",               default: false
    t.boolean  "age_12",               default: false
    t.boolean  "age_13",               default: false
    t.boolean  "age_14",               default: false
    t.boolean  "age_15",               default: false
    t.boolean  "age_16",               default: false
    t.boolean  "age_17",               default: false
    t.boolean  "age_18",               default: false
    t.boolean  "age_19",               default: false
    t.boolean  "age_20",               default: false
    t.boolean  "required",             default: true
  end

  add_index "publisher_product_from_ages", ["publisher_product_id"], name: "index_from_ages_on_publisher_product_id", using: :btree

  create_table "publisher_product_from_grades", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.boolean  "grade_1",              default: false
    t.boolean  "grade_2",              default: false
    t.boolean  "grade_3",              default: false
    t.boolean  "grade_4",              default: false
    t.boolean  "grade_5",              default: false
    t.boolean  "grade_6",              default: false
    t.boolean  "grade_7",              default: false
    t.boolean  "grade_8",              default: false
    t.boolean  "grade_9",              default: false
    t.boolean  "grade_10",             default: false
    t.boolean  "grade_11",             default: false
    t.boolean  "grade_12",             default: false
    t.boolean  "grade_13",             default: false
    t.boolean  "grade_14",             default: false
    t.boolean  "grade_15",             default: false
    t.boolean  "grade_16",             default: false
    t.boolean  "required",             default: true
  end

  add_index "publisher_product_from_grades", ["publisher_product_id"], name: "index_from_grades_on_publisher_product_id", using: :btree

  create_table "publisher_product_images", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_product_images", ["publisher_id"], name: "index_publisher_product_images_on_publisher_id", using: :btree
  add_index "publisher_product_images", ["publisher_product_id"], name: "index_publisher_product_images_on_publisher_product_id", using: :btree

  create_table "publisher_product_lesson_times", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.boolean  "lesson_time_1",               default: false
    t.boolean  "lesson_time_2",               default: false
    t.boolean  "lesson_time_3",               default: false
    t.boolean  "lesson_time_4",               default: false
    t.boolean  "lesson_time_5",               default: false
    t.boolean  "lesson_time_6",               default: false
    t.boolean  "lesson_time_7",               default: false
    t.boolean  "lesson_time_8",               default: false
    t.boolean  "lesson_time_9",               default: false
    t.boolean  "lesson_time_10",              default: false
    t.boolean  "lesson_time_11",              default: false
    t.boolean  "lesson_time_12",              default: false
    t.boolean  "lesson_time_13",              default: false
    t.boolean  "lesson_time_14",              default: false
    t.boolean  "lesson_time_15",              default: false
    t.boolean  "lesson_time_16",              default: false
    t.boolean  "lesson_time_17",              default: false
    t.boolean  "lesson_time_18",              default: false
    t.boolean  "lesson_time_19",              default: false
    t.boolean  "lesson_time_20",              default: false
    t.boolean  "lesson_time_21",              default: false
    t.boolean  "lesson_time_22",              default: false
    t.boolean  "lesson_time_23",              default: false
    t.boolean  "lesson_time_24",              default: false
    t.boolean  "lesson_time_25",              default: false
    t.boolean  "lesson_time_26",              default: false
    t.boolean  "lesson_time_27",              default: false
    t.boolean  "lesson_time_28",              default: false
    t.boolean  "lesson_time_29",              default: false
    t.boolean  "lesson_time_30",              default: false
    t.boolean  "lesson_time_31",              default: false
    t.boolean  "lesson_time_32",              default: false
    t.boolean  "lesson_time_33",              default: false
    t.boolean  "lesson_time_34",              default: false
    t.boolean  "lesson_time_35",              default: false
    t.boolean  "lesson_time_36",              default: false
    t.boolean  "lesson_time_37",              default: false
    t.boolean  "lesson_time_38",              default: false
    t.boolean  "lesson_time_39",              default: false
    t.boolean  "lesson_time_40",              default: false
    t.boolean  "lesson_time_41",              default: false
    t.boolean  "lesson_time_42",              default: false
    t.boolean  "lesson_time_43",              default: false
    t.boolean  "lesson_time_44",              default: false
    t.boolean  "lesson_time_45",              default: false
    t.boolean  "lesson_time_46",              default: false
    t.boolean  "lesson_time_47",              default: false
    t.boolean  "lesson_time_48",              default: false
    t.string   "lesson_time_other"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lesson_time_pertinent_index", default: 0
    t.string   "lesson_time_pertinent"
  end

  add_index "publisher_product_lesson_times", ["publisher_id"], name: "index_lesson_time_on_publisher_id", using: :btree
  add_index "publisher_product_lesson_times", ["publisher_product_id"], name: "index_lesson_time_on_publisher_product_id", using: :btree

  create_table "publisher_product_logo1_images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",              default: 0
    t.integer  "publisher_id",         default: 0
    t.integer  "publisher_product_id", default: 0
    t.string   "image"
    t.string   "image_name"
    t.boolean  "primary",              default: false
    t.integer  "order",                default: 0
    t.integer  "crop_x",               default: 0
    t.integer  "crop_y",               default: 0
    t.integer  "crop_w",               default: 0
    t.integer  "crop_h",               default: 0
  end

  add_index "publisher_product_logo1_images", ["publisher_product_id"], name: "index_publisher_product_logo1_images_on_publisher_product_id", using: :btree

  create_table "publisher_product_logos", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  add_index "publisher_product_logos", ["publisher_id"], name: "index_publisher_product_logos_on_publisher_id", using: :btree
  add_index "publisher_product_logos", ["publisher_product_id"], name: "index_publisher_product_logos_on_publisher_product_id", using: :btree

  create_table "publisher_product_manifests", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_product_id",   default: 0
    t.integer  "publisher_id",           default: 0
    t.string   "name_product",           default: ""
    t.string   "versions",               default: ""
    t.string   "updating_refresh_rate",  default: ""
    t.string   "updating_type",          default: ""
    t.boolean  "reselling",              default: false
    t.string   "evaluation",             default: ""
    t.boolean  "allow_teacher_rating",   default: false
    t.boolean  "user_rating_1",          default: false
    t.boolean  "user_rating_2",          default: false
    t.boolean  "user_rating_3",          default: false
    t.boolean  "allow_student_likes",    default: false
    t.boolean  "allow_comments",         default: false
    t.boolean  "research_1",             default: false
    t.boolean  "research_2",             default: false
    t.boolean  "pr_updates_1",           default: false
    t.boolean  "pr_updates_2",           default: false
    t.boolean  "pr_updates_3",           default: false
    t.boolean  "pr_updates_4",           default: false
    t.boolean  "metrics_1",              default: false
    t.boolean  "metrics_2",              default: false
    t.boolean  "metrics_3",              default: false
    t.boolean  "metrics_4",              default: false
    t.boolean  "metrics_5",              default: false
    t.string   "core_literacy_standard", default: ""
    t.string   "core_math_standard",     default: ""
    t.datetime "form_update",            default: '2000-01-01 00:00:00'
    t.boolean  "poster_print_purchase",  default: false
    t.boolean  "poster_pin_web",         default: false
    t.boolean  "poster_pin_purchase",    default: false
    t.string   "corporate_logo_url",     default: ""
    t.integer  "lesson_time_hours",      default: 0
    t.integer  "lesson_time_minutes",    default: 0
    t.integer  "course_time_hours",      default: 0
    t.integer  "course_time_days",       default: 0
    t.integer  "course_time_months",     default: 0
    t.boolean  "time_per_lesson",        default: false
    t.boolean  "time_per_course",        default: false
    t.string   "product_tagline",        default: ""
    t.string   "source_url",             default: ""
  end

  add_index "publisher_product_manifests", ["publisher_id"], name: "index_publisher_product_manifests_on_publisher_id", using: :btree
  add_index "publisher_product_manifests", ["publisher_product_id"], name: "index_publisher_product_manifests_on_publisher_product_id", using: :btree

  create_table "publisher_product_market_targets", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.boolean  "market_target_1",      default: false
    t.boolean  "market_target_2",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_product_market_targets", ["publisher_id"], name: "index_mark_targ_on_publisher_id", using: :btree
  add_index "publisher_product_market_targets", ["publisher_product_id"], name: "index_mark_targ_on_publisher_product_id", using: :btree

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

  create_table "publisher_product_pdf_images", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_product_pdf_id"
  end

  add_index "publisher_product_pdf_images", ["publisher_product_pdf_id"], name: "index_pub_prod_pdf_images_on_publisher_product_pdf_id", using: :btree

  create_table "publisher_product_pdfs", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name_file"
    t.string   "image"
    t.string   "name_pdf"
    t.string   "attachment"
  end

  add_index "publisher_product_pdfs", ["publisher_product_id"], name: "index_pub_prod_pdfs_on_publisher_product_id", using: :btree

  create_table "publisher_product_platforms", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.boolean  "platform_1",           default: false
    t.boolean  "platform_2",           default: false
    t.boolean  "platform_3",           default: false
    t.boolean  "platform_4",           default: false
    t.boolean  "platform_5",           default: false
    t.boolean  "platform_6",           default: false
    t.boolean  "platform_7",           default: false
    t.boolean  "platform_8",           default: false
    t.boolean  "platform_9",           default: false
    t.boolean  "platform_10",          default: false
    t.boolean  "platform_11",          default: false
    t.boolean  "platform_12",          default: false
    t.boolean  "platform_13",          default: false
    t.boolean  "platform_14",          default: false
    t.boolean  "platform_15",          default: false
    t.boolean  "platform_16",          default: false
    t.boolean  "platform_17",          default: false
    t.boolean  "platform_18",          default: false
    t.boolean  "platform_19",          default: false
    t.boolean  "platform_20",          default: false
    t.boolean  "platform_21",          default: false
    t.boolean  "platform_22",          default: false
    t.boolean  "platform_23",          default: false
    t.boolean  "platform_24",          default: false
    t.boolean  "platform_25",          default: false
    t.boolean  "platform_26",          default: false
    t.boolean  "platform_27",          default: false
    t.boolean  "platform_28",          default: false
    t.boolean  "platform_29",          default: false
    t.boolean  "platform_30",          default: false
    t.boolean  "platform_31",          default: false
    t.boolean  "platform_32",          default: false
    t.boolean  "platform_33",          default: false
    t.boolean  "platform_34",          default: false
    t.boolean  "platform_35",          default: false
    t.boolean  "platform_36",          default: false
    t.boolean  "platform_37",          default: false
    t.boolean  "platform_38",          default: false
    t.boolean  "platform_39",          default: false
    t.boolean  "platform_40",          default: false
    t.boolean  "platform_41",          default: false
    t.boolean  "platform_42",          default: false
    t.boolean  "platform_43",          default: false
    t.boolean  "platform_44",          default: false
    t.boolean  "platform_45",          default: false
    t.boolean  "platform_46",          default: false
    t.boolean  "platform_47",          default: false
    t.boolean  "platform_48",          default: false
    t.boolean  "platform_49",          default: false
    t.boolean  "platform_50",          default: false
    t.string   "platform_other"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "platform_other_b",     default: false
  end

  add_index "publisher_product_platforms", ["publisher_id"], name: "index_platform_on_publisher_id", using: :btree
  add_index "publisher_product_platforms", ["publisher_product_id"], name: "index_platform_on_publisher_product_id", using: :btree

  create_table "publisher_product_pos1_images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_product_id", default: 0
    t.integer  "publisher_id",         default: 0
    t.integer  "user_id",              default: 0
    t.string   "image"
    t.string   "image_name"
    t.boolean  "primary",              default: false
    t.integer  "order",                default: 0
    t.integer  "crop_x",               default: 0
    t.integer  "crop_y",               default: 0
    t.integer  "crop_w",               default: 0
    t.integer  "crop_h",               default: 0
  end

  add_index "publisher_product_pos1_images", ["publisher_product_id"], name: "index_publisher_product_pos1_images_on_publisher_product_id", using: :btree

  create_table "publisher_product_pos2_images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_product_id", default: 0
    t.integer  "publisher_id",         default: 0
    t.integer  "user_id",              default: 0
    t.string   "image"
    t.string   "image_name"
    t.boolean  "primary",              default: false
    t.integer  "order",                default: 0
    t.integer  "crop_x",               default: 0
    t.integer  "crop_y",               default: 0
    t.integer  "crop_w",               default: 0
    t.integer  "crop_h",               default: 0
  end

  add_index "publisher_product_pos2_images", ["publisher_product_id"], name: "index_publisher_product_pos2_images_on_publisher_product_id", using: :btree

  create_table "publisher_product_pos3_images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_product_id", default: 0
    t.integer  "publisher_id",         default: 0
    t.integer  "user_id",              default: 0
    t.string   "image"
    t.string   "image_name"
    t.boolean  "primary",              default: false
    t.integer  "order",                default: 0
    t.integer  "crop_x",               default: 0
    t.integer  "crop_y",               default: 0
    t.integer  "crop_w",               default: 0
    t.integer  "crop_h",               default: 0
  end

  add_index "publisher_product_pos3_images", ["publisher_product_id"], name: "index_publisher_product_pos3_images_on_publisher_product_id", using: :btree

  create_table "publisher_product_pos4_images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_product_id", default: 0
    t.integer  "publisher_id",         default: 0
    t.integer  "user_id",              default: 0
    t.string   "image"
    t.string   "image_name"
    t.boolean  "primary",              default: false
    t.integer  "order",                default: 0
    t.integer  "crop_x",               default: 0
    t.integer  "crop_y",               default: 0
    t.integer  "crop_w",               default: 0
    t.integer  "crop_h",               default: 0
  end

  add_index "publisher_product_pos4_images", ["publisher_product_id"], name: "index_publisher_product_pos4_images_on_publisher_product_id", using: :btree

  create_table "publisher_product_prices", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.boolean  "price_1",                                      default: false
    t.decimal  "price_1_dec",          precision: 8, scale: 2, default: 0.0
    t.boolean  "price_2",                                      default: false
    t.decimal  "price_2_dec",          precision: 8, scale: 2, default: 0.0
    t.boolean  "price_3",                                      default: false
    t.decimal  "price_3_dec",          precision: 8, scale: 2, default: 0.0
    t.boolean  "price_4",                                      default: false
    t.decimal  "price_4_dec",          precision: 8, scale: 2, default: 0.0
    t.boolean  "price_5",                                      default: false
    t.decimal  "price_5_dec",          precision: 8, scale: 2, default: 0.0
    t.boolean  "price_6",                                      default: false
    t.decimal  "price_6_dec",          precision: 8, scale: 2, default: 0.0
    t.boolean  "price_7",                                      default: false
    t.decimal  "price_7_dec",          precision: 8, scale: 2, default: 0.0
    t.boolean  "price_8",                                      default: false
    t.decimal  "price_8_dec",          precision: 8, scale: 2, default: 0.0
    t.boolean  "price_9",                                      default: false
    t.decimal  "price_9_dec",          precision: 8, scale: 2, default: 0.0
    t.boolean  "price_10",                                     default: false
    t.decimal  "price_10_dec",         precision: 8, scale: 2, default: 0.0
    t.boolean  "price_11",                                     default: false
    t.decimal  "price_11_dec",         precision: 8, scale: 2, default: 0.0
    t.boolean  "price_12",                                     default: false
    t.decimal  "price_12_dec",         precision: 8, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_product_prices", ["publisher_id"], name: "index_price_on_publisher_id", using: :btree
  add_index "publisher_product_prices", ["publisher_product_id"], name: "index_price_on_publisher_product_id", using: :btree

  create_table "publisher_product_pricing_models", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.boolean  "pricing_model_1",      default: false
    t.boolean  "pricing_model_2",      default: false
    t.boolean  "pricing_model_3",      default: false
    t.boolean  "pricing_model_4",      default: false
    t.boolean  "pricing_model_5",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_product_pricing_models", ["publisher_id"], name: "index_pricing_model_on_publisher_id", using: :btree
  add_index "publisher_product_pricing_models", ["publisher_product_id"], name: "index_pricing_model_on_publisher_product_id", using: :btree

  create_table "publisher_product_subjects", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_product_id"
    t.integer  "publisher_id"
    t.text     "subject_text",         default: ""
  end

  add_index "publisher_product_subjects", ["publisher_id"], name: "index_publisher_product_subjects_on_publisher_id", using: :btree
  add_index "publisher_product_subjects", ["publisher_product_id"], name: "index_on_publisher_product_subjects_on_publisher_product_id", using: :btree

  create_table "publisher_product_to_ages", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.boolean  "age_1",                default: false
    t.boolean  "age_2",                default: false
    t.boolean  "age_3",                default: false
    t.boolean  "age_4",                default: false
    t.boolean  "age_5",                default: false
    t.boolean  "age_6",                default: false
    t.boolean  "age_7",                default: false
    t.boolean  "age_8",                default: false
    t.boolean  "age_9",                default: false
    t.boolean  "age_10",               default: false
    t.boolean  "age_11",               default: false
    t.boolean  "age_12",               default: false
    t.boolean  "age_13",               default: false
    t.boolean  "age_14",               default: false
    t.boolean  "age_15",               default: false
    t.boolean  "age_16",               default: false
    t.boolean  "age_17",               default: false
    t.boolean  "age_18",               default: false
    t.boolean  "age_19",               default: false
    t.boolean  "age_20",               default: false
    t.boolean  "required",             default: true
  end

  add_index "publisher_product_to_ages", ["publisher_product_id"], name: "index_to_ages_on_publisher_product_id", using: :btree

  create_table "publisher_product_to_grades", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.boolean  "grade_1",              default: false
    t.boolean  "grade_2",              default: false
    t.boolean  "grade_3",              default: false
    t.boolean  "grade_4",              default: false
    t.boolean  "grade_5",              default: false
    t.boolean  "grade_6",              default: false
    t.boolean  "grade_7",              default: false
    t.boolean  "grade_8",              default: false
    t.boolean  "grade_9",              default: false
    t.boolean  "grade_10",             default: false
    t.boolean  "grade_11",             default: false
    t.boolean  "grade_12",             default: false
    t.boolean  "grade_13",             default: false
    t.boolean  "grade_14",             default: false
    t.boolean  "grade_15",             default: false
    t.boolean  "grade_16",             default: false
    t.boolean  "required",             default: true
  end

  add_index "publisher_product_to_grades", ["publisher_product_id"], name: "index_to_grades_on_publisher_product_id", using: :btree

  create_table "publisher_product_topics", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_product_id"
    t.integer  "publisher_id"
    t.text     "topic_text",           default: ""
  end

  add_index "publisher_product_topics", ["publisher_id"], name: "index_publisher_product_topics_on_publisher_id", using: :btree
  add_index "publisher_product_topics", ["publisher_product_id"], name: "index_on_publisher_product_topics_on_publisher_product_id", using: :btree

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
    t.string   "slug"
  end

  add_index "publisher_products", ["publisher_id"], name: "index_publisher_products_on_publisher_id", using: :btree

  create_table "publisher_profile_images", force: true do |t|
    t.integer  "user_id"
    t.integer  "publisher_id"
    t.string   "image"
    t.string   "image_name"
    t.boolean  "primary",      default: false
    t.integer  "order",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "crop_x",       default: 0
    t.integer  "crop_y",       default: 0
    t.integer  "crop_w",       default: 0
    t.integer  "crop_h",       default: 0
  end

  add_index "publisher_profile_images", ["publisher_id"], name: "index_publisher_profile_images_on_publisher_id", using: :btree

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

  create_table "publisher_user_images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",           default: 0
    t.integer  "publisher_id",      default: 0
    t.integer  "publisher_user_id", default: 0
    t.string   "image"
    t.string   "image_name"
    t.boolean  "primary",           default: false
    t.integer  "order",             default: 0
    t.integer  "crop_x",            default: 0
    t.integer  "crop_y",            default: 0
    t.integer  "crop_w",            default: 0
    t.integer  "crop_h",            default: 0
  end

  create_table "publisher_user_interest_images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_user_interest_id", default: 0
    t.integer  "publisher_user_id",          default: 0
    t.integer  "publisher_id",               default: 0
    t.integer  "user_id",                    default: 0
    t.string   "image"
    t.string   "image_name"
    t.boolean  "primary",                    default: false
    t.integer  "order",                      default: 0
    t.integer  "crop_x",                     default: 0
    t.integer  "crop_y",                     default: 0
    t.integer  "crop_w",                     default: 0
    t.integer  "crop_h",                     default: 0
  end

  add_index "publisher_user_interest_images", ["publisher_user_interest_id"], name: "index_on_publisher_user_interest_images_id", unique: true, using: :btree

  create_table "publisher_user_interests", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_user_id"
    t.integer  "publisher_id"
    t.integer  "user_id"
    t.text     "interest_text",     default: ""
  end

  add_index "publisher_user_interests", ["publisher_id"], name: "index_publisher_user_interests_on_publisher_id", using: :btree
  add_index "publisher_user_interests", ["publisher_user_id"], name: "index_publisher_user_interests_on_publisher_user_id", unique: true, using: :btree
  add_index "publisher_user_interests", ["user_id"], name: "index_publisher_user_interests_on_user_id", using: :btree

  create_table "publisher_user_logo_images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",           default: 0
    t.integer  "publisher_id",      default: 0
    t.integer  "publisher_user_id", default: 0
    t.string   "image"
    t.string   "image_name"
    t.boolean  "primary",           default: false
    t.integer  "order",             default: 0
    t.integer  "crop_x",            default: 0
    t.integer  "crop_y",            default: 0
    t.integer  "crop_w",            default: 0
    t.integer  "crop_h",            default: 0
    t.integer  "width",             default: 0
    t.integer  "height",            default: 0
  end

  add_index "publisher_user_logo_images", ["publisher_user_id"], name: "index_publisher_user_logo_images_on_publisher_user_id", using: :btree

  create_table "publisher_user_plot_images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_user_plot_id", default: 0
    t.integer  "publisher_user_id",      default: 0
    t.integer  "publisher_id",           default: 0
    t.integer  "user_id",                default: 0
    t.string   "image"
    t.string   "image_name"
    t.boolean  "primary",                default: false
    t.integer  "order",                  default: 0
    t.integer  "crop_x",                 default: 0
    t.integer  "crop_y",                 default: 0
    t.integer  "crop_w",                 default: 0
    t.integer  "crop_h",                 default: 0
  end

  add_index "publisher_user_plot_images", ["publisher_user_plot_id"], name: "index_on_publisher_user_plot_images_id", unique: true, using: :btree

  create_table "publisher_user_plots", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_user_id"
    t.integer  "publisher_id"
    t.integer  "user_id"
    t.text     "plot_text",         default: ""
  end

  add_index "publisher_user_plots", ["publisher_id"], name: "index_publisher_user_plots_on_publisher_id", using: :btree
  add_index "publisher_user_plots", ["publisher_user_id"], name: "index_publisher_user_plots_on_publisher_user_id", unique: true, using: :btree
  add_index "publisher_user_plots", ["user_id"], name: "index_publisher_user_plots_on_user_id", using: :btree

  create_table "publisher_users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",             default: 0
    t.integer  "publisher_id",        default: 0
    t.integer  "publisher_member_id", default: 0
    t.string   "slug"
    t.string   "location"
    t.string   "job_title"
    t.string   "phone_company"
    t.string   "website"
    t.integer  "years_at_company",    default: 0
    t.string   "email"
    t.string   "name_alias"
    t.string   "name_company"
    t.string   "time_at_company"
    t.text     "story_plot",          default: ""
    t.text     "story_interest",      default: ""
  end

  add_index "publisher_users", ["publisher_id"], name: "index_publisher_users_on_publisher_id", using: :btree
  add_index "publisher_users", ["slug"], name: "index_publisher_users_on_slug", unique: true, using: :btree

  create_table "publishers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "zip"
    t.string   "slug"
    t.string   "name_company"
    t.string   "address1"
    t.string   "address2"
    t.string   "website"
    t.string   "phone_company"
    t.string   "email_info"
    t.string   "email_admin"
    t.string   "name_admin"
    t.string   "tagline_logo"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.text     "story_corporate", default: ""
    t.integer  "id_gen"
    t.string   "id_per",          default: ""
    t.boolean  "id_per_b",        default: false
    t.string   "slug_pre_id",     default: ""
  end

  add_index "publishers", ["slug"], name: "index_publishers_on_slug", unique: true, using: :btree

  create_table "relate_follows", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "follower_id"
    t.integer  "followed_id"
  end

  create_table "relate_log_publishers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "follower_id"
    t.integer  "followed_id"
  end

  create_table "relate_log_users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "follower_id"
    t.integer  "followed_id"
  end

  create_table "relate_publisher_follows", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "follower_id"
    t.integer  "followed_id"
  end

  create_table "user_connections", force: true do |t|
    t.integer  "user_id"
    t.integer  "connection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_connections", ["connection_id"], name: "index_user_connections_on_connection_id", using: :btree
  add_index "user_connections", ["user_id"], name: "index_user_connections_on_user_id", using: :btree

  create_table "user_groups", force: true do |t|
    t.integer  "user_id"
    t.string   "name_group"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_groups", ["user_id"], name: "index_user_groups_on_user_id", using: :btree

  create_table "user_images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    default: 0
    t.string   "image"
    t.string   "image_name"
    t.boolean  "primary",    default: false
    t.integer  "order",      default: 0
    t.integer  "crop_x",     default: 0
    t.integer  "crop_y",     default: 0
    t.integer  "crop_w",     default: 0
    t.integer  "crop_h",     default: 0
    t.integer  "width",      default: 0
    t.integer  "height",     default: 0
  end

  add_index "user_images", ["user_id"], name: "index_user_images_on_user_id", using: :btree

  create_table "user_messages", force: true do |t|
    t.integer  "user_id"
    t.integer  "sender_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_messages", ["sender_id"], name: "index_user_messages_on_sender_id", using: :btree
  add_index "user_messages", ["user_id"], name: "index_user_messages_on_user_id", using: :btree

  create_table "user_profile_images", force: true do |t|
    t.integer  "user_id"
    t.string   "image"
    t.string   "image_name"
    t.boolean  "primary",    default: false
    t.integer  "order",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_profile_images", ["user_id"], name: "index_user_profile_images_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  limit: 50,  default: ""
    t.string   "username",               limit: 50
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "has_account",                        default: false
    t.string   "name_first",             limit: 50
    t.string   "name_last",              limit: 50
    t.integer  "bd_day",                             default: 0
    t.integer  "bd_month",                           default: 0
    t.integer  "bd_year",                            default: 0
    t.integer  "gender",                             default: 0
    t.string   "bd_month_text"
    t.string   "gender_text"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.integer  "id_gen",                 limit: 8,   default: 0
    t.string   "id_per",                             default: ""
    t.string   "slug",                   limit: 200
    t.string   "avatar_image"
    t.string   "slug_pre_id"
    t.boolean  "id_per_b",                           default: false
    t.integer  "profile_type",                       default: 0
    t.string   "profile_type_text"
    t.boolean  "new_user",                           default: true
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

end
