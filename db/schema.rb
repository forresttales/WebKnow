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

ActiveRecord::Schema.define(version: 20140822102737) do

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

  create_table "image_idents", force: true do |t|
    t.string   "assigned_text"
    t.integer  "assigned_digit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "assigned_text_1"
    t.string   "assigned_text_2"
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
    t.string   "url"
    t.string   "main_sales_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pos_map",                    default: 0
  end

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
    t.string   "url"
    t.string   "main_sales_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pos_map",                    default: 0
  end

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
    t.string   "url"
    t.string   "main_sales_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pos_map",                    default: 0
  end

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
    t.string   "url"
    t.string   "main_sales_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pos_map",                    default: 0
  end

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
    t.string   "url"
    t.string   "main_sales_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pos_map",                    default: 0
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
    t.decimal  "price",                     precision: 5, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo"
    t.text     "word_descr"
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
    t.integer  "poster"
    t.string   "poster_text"
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

  create_table "paintings", force: true do |t|
    t.integer  "gallery_id"
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "publisher_journalposter_positions", force: true do |t|
    t.integer  "id_map"
    t.integer  "pos_map",    default: 0
    t.integer  "pos_x",      default: 0
    t.integer  "pos_y",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_journalposter_positions", ["id_map"], name: "index_publisher_journalposter_positions_on_id_map", using: :btree

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

  create_table "publisher_metrics", force: true do |t|
    t.integer  "user_id"
    t.string   "name_metric"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_metrics", ["user_id"], name: "index_publisher_metrics_on_user_id", using: :btree

  create_table "publisher_product_appropriate_ages", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.integer  "publisher_product_description_id"
    t.boolean  "age_appropriate_1",                default: false
    t.boolean  "age_appropriate_2",                default: false
    t.boolean  "age_appropriate_3",                default: false
    t.boolean  "age_appropriate_4",                default: false
    t.boolean  "age_appropriate_5",                default: false
    t.boolean  "age_appropriate_6",                default: false
    t.boolean  "age_appropriate_7",                default: false
    t.boolean  "age_appropriate_8",                default: false
    t.boolean  "age_appropriate_9",                default: false
    t.boolean  "age_appropriate_10",               default: false
    t.boolean  "age_appropriate_11",               default: false
    t.boolean  "age_appropriate_12",               default: false
    t.boolean  "age_appropriate_13",               default: false
    t.boolean  "age_appropriate_14",               default: false
    t.boolean  "age_appropriate_15",               default: false
    t.boolean  "age_appropriate_16",               default: false
    t.boolean  "age_appropriate_17",               default: false
    t.boolean  "age_appropriate_adult",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_product_appropriate_ages", ["publisher_id"], name: "index_appr_age_on_publisher_id", using: :btree
  add_index "publisher_product_appropriate_ages", ["publisher_product_description_id"], name: "index_appr_age_on_publisher_product_description_id", using: :btree
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

  create_table "publisher_product_category_subjects", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.integer  "publisher_product_description_id"
    t.boolean  "category_subject_1",               default: false
    t.boolean  "category_subject_2",               default: false
    t.boolean  "category_subject_3",               default: false
    t.boolean  "category_subject_4",               default: false
    t.boolean  "category_subject_5",               default: false
    t.boolean  "category_subject_6",               default: false
    t.boolean  "category_subject_7",               default: false
    t.boolean  "category_subject_8",               default: false
    t.boolean  "category_subject_9",               default: false
    t.boolean  "category_subject_10",              default: false
    t.boolean  "category_subject_11",              default: false
    t.boolean  "category_subject_12",              default: false
    t.boolean  "category_subject_13",              default: false
    t.boolean  "category_subject_14",              default: false
    t.boolean  "category_subject_15",              default: false
    t.boolean  "category_subject_16",              default: false
    t.boolean  "category_subject_17",              default: false
    t.boolean  "category_subject_18",              default: false
    t.boolean  "category_subject_19",              default: false
    t.boolean  "category_subject_20",              default: false
    t.boolean  "category_subject_21",              default: false
    t.boolean  "category_subject_22",              default: false
    t.boolean  "category_subject_23",              default: false
    t.boolean  "category_subject_24",              default: false
    t.boolean  "category_subject_25",              default: false
    t.boolean  "category_subject_26",              default: false
    t.boolean  "category_subject_27",              default: false
    t.boolean  "category_subject_28",              default: false
    t.boolean  "category_subject_29",              default: false
    t.boolean  "category_subject_30",              default: false
    t.boolean  "category_subject_31",              default: false
    t.boolean  "category_subject_32",              default: false
    t.boolean  "category_subject_33",              default: false
    t.boolean  "category_subject_34",              default: false
    t.boolean  "category_subject_35",              default: false
    t.boolean  "category_subject_36",              default: false
    t.boolean  "category_subject_37",              default: false
    t.boolean  "category_subject_38",              default: false
    t.boolean  "category_subject_39",              default: false
    t.boolean  "category_subject_40",              default: false
    t.boolean  "category_subject_41",              default: false
    t.boolean  "category_subject_42",              default: false
    t.boolean  "category_subject_43",              default: false
    t.boolean  "category_subject_44",              default: false
    t.boolean  "category_subject_45",              default: false
    t.boolean  "category_subject_46",              default: false
    t.boolean  "category_subject_47",              default: false
    t.boolean  "category_subject_48",              default: false
    t.boolean  "category_subject_49",              default: false
    t.boolean  "category_subject_50",              default: false
    t.boolean  "category_subject_51",              default: false
    t.boolean  "category_subject_52",              default: false
    t.boolean  "category_subject_53",              default: false
    t.boolean  "category_subject_54",              default: false
    t.boolean  "category_subject_55",              default: false
    t.boolean  "category_subject_56",              default: false
    t.boolean  "category_subject_57",              default: false
    t.boolean  "category_subject_58",              default: false
    t.boolean  "category_subject_59",              default: false
    t.boolean  "category_subject_60",              default: false
    t.boolean  "category_subject_61",              default: false
    t.boolean  "category_subject_62",              default: false
    t.boolean  "category_subject_63",              default: false
    t.boolean  "category_subject_64",              default: false
    t.boolean  "category_subject_65",              default: false
    t.boolean  "category_subject_66",              default: false
    t.boolean  "category_subject_67",              default: false
    t.boolean  "category_subject_68",              default: false
    t.boolean  "category_subject_69",              default: false
    t.boolean  "category_subject_70",              default: false
    t.string   "category_subject_other"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_product_category_subjects", ["publisher_id"], name: "index_category_subject_on_publisher_id", using: :btree
  add_index "publisher_product_category_subjects", ["publisher_product_id"], name: "index_category_subject_on_publisher_product_id", using: :btree

  create_table "publisher_product_characters", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.integer  "publisher_product_description_id"
    t.boolean  "character_1",                      default: false
    t.boolean  "character_2",                      default: false
    t.boolean  "character_3",                      default: false
    t.boolean  "character_4",                      default: false
    t.boolean  "character_5",                      default: false
    t.boolean  "character_6",                      default: false
    t.boolean  "character_7",                      default: false
    t.boolean  "character_8",                      default: false
    t.boolean  "character_9",                      default: false
    t.boolean  "character_10",                     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_product_characters", ["publisher_id"], name: "index_character_on_publisher_id", using: :btree
  add_index "publisher_product_characters", ["publisher_product_id"], name: "index_character_on_publisher_product_id", using: :btree

  create_table "publisher_product_content_types", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.integer  "publisher_product_description_id"
    t.boolean  "content_type_1",                   default: false
    t.boolean  "content_type_2",                   default: false
    t.boolean  "content_type_3",                   default: false
    t.boolean  "content_type_4",                   default: false
    t.boolean  "content_type_5",                   default: false
    t.boolean  "content_type_6",                   default: false
    t.boolean  "content_type_7",                   default: false
    t.boolean  "content_type_8",                   default: false
    t.boolean  "content_type_9",                   default: false
    t.boolean  "content_type_10",                  default: false
    t.boolean  "content_type_11",                  default: false
    t.boolean  "content_type_12",                  default: false
    t.boolean  "content_type_13",                  default: false
    t.boolean  "content_type_14",                  default: false
    t.boolean  "content_type_15",                  default: false
    t.boolean  "content_type_16",                  default: false
    t.boolean  "content_type_17",                  default: false
    t.boolean  "content_type_18",                  default: false
    t.boolean  "content_type_19",                  default: false
    t.boolean  "content_type_20",                  default: false
    t.string   "content_type_other"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  add_index "publisher_product_core_math_standards", ["publisher_id"], name: "index_cms_on_publisher_id", using: :btree
  add_index "publisher_product_core_math_standards", ["publisher_product_id"], name: "index_cms_on_publisher_product_id", using: :btree

  create_table "publisher_product_descriptions", force: true do |t|
    t.integer  "publisher_product_id"
    t.integer  "publisher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "word_description"
    t.string   "name_product"
    t.text     "description"
    t.string   "source_url"
    t.string   "versions"
    t.string   "slugged",                default: ""
    t.string   "product_tagline"
    t.text     "topic"
    t.text     "lesson_plan_subject"
    t.string   "updating_refresh_rate"
    t.string   "updating_type"
    t.boolean  "reselling",              default: false
    t.string   "evaluation"
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
    t.string   "core_literacy_standard"
    t.string   "core_math_standard"
    t.datetime "form_update",            default: '2000-01-01 00:00:00'
  end

  add_index "publisher_product_descriptions", ["publisher_id"], name: "index_publisher_product_descriptions_on_publisher_id", using: :btree
  add_index "publisher_product_descriptions", ["publisher_product_id"], name: "index_publisher_product_descriptions_on_publisher_product_id", using: :btree

  create_table "publisher_product_enhancements", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.integer  "publisher_product_description_id"
    t.boolean  "enhancement_1",                    default: false
    t.boolean  "enhancement_2",                    default: false
    t.boolean  "enhancement_3",                    default: false
    t.boolean  "enhancement_4",                    default: false
    t.boolean  "enhancement_5",                    default: false
    t.boolean  "enhancement_6",                    default: false
    t.boolean  "enhancement_7",                    default: false
    t.boolean  "enhancement_8",                    default: false
    t.boolean  "enhancement_9",                    default: false
    t.boolean  "enhancement_10",                   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enhancement_11",                   default: false
    t.boolean  "enhancement_12",                   default: false
    t.boolean  "enhancement_13",                   default: false
    t.boolean  "enhancement_14",                   default: false
    t.boolean  "enhancement_15",                   default: false
    t.boolean  "enhancement_16",                   default: false
    t.boolean  "enhancement_17",                   default: false
    t.boolean  "enhancement_18",                   default: false
    t.boolean  "enhancement_19",                   default: false
    t.boolean  "enhancement_20",                   default: false
  end

  add_index "publisher_product_enhancements", ["publisher_id"], name: "index_enhancement_on_publisher_id", using: :btree
  add_index "publisher_product_enhancements", ["publisher_product_id"], name: "index_enhancement_on_publisher_product_id", using: :btree

  create_table "publisher_product_file_types", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.integer  "publisher_product_description_id"
    t.boolean  "file_type_1",                      default: false
    t.boolean  "file_type_2",                      default: false
    t.boolean  "file_type_3",                      default: false
    t.boolean  "file_type_4",                      default: false
    t.boolean  "file_type_5",                      default: false
    t.boolean  "file_type_6",                      default: false
    t.boolean  "file_type_7",                      default: false
    t.boolean  "file_type_8",                      default: false
    t.boolean  "file_type_9",                      default: false
    t.boolean  "file_type_10",                     default: false
    t.boolean  "file_type_11",                     default: false
    t.boolean  "file_type_12",                     default: false
    t.boolean  "file_type_13",                     default: false
    t.boolean  "file_type_14",                     default: false
    t.boolean  "file_type_15",                     default: false
    t.boolean  "file_type_16",                     default: false
    t.boolean  "file_type_17",                     default: false
    t.boolean  "file_type_18",                     default: false
    t.boolean  "file_type_19",                     default: false
    t.boolean  "file_type_20",                     default: false
    t.boolean  "file_type_21",                     default: false
    t.boolean  "file_type_22",                     default: false
    t.boolean  "file_type_23",                     default: false
    t.boolean  "file_type_24",                     default: false
    t.boolean  "file_type_25",                     default: false
    t.boolean  "file_type_26",                     default: false
    t.boolean  "file_type_27",                     default: false
    t.boolean  "file_type_28",                     default: false
    t.boolean  "file_type_29",                     default: false
    t.boolean  "file_type_30",                     default: false
    t.string   "file_type_other"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_product_file_types", ["publisher_id"], name: "index_file_type_on_publisher_id", using: :btree
  add_index "publisher_product_file_types", ["publisher_product_id"], name: "index_file_type_on_publisher_product_id", using: :btree

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
    t.integer  "publisher_product_description_id"
    t.boolean  "lesson_time_1",                    default: false
    t.boolean  "lesson_time_2",                    default: false
    t.boolean  "lesson_time_3",                    default: false
    t.boolean  "lesson_time_4",                    default: false
    t.boolean  "lesson_time_5",                    default: false
    t.boolean  "lesson_time_6",                    default: false
    t.boolean  "lesson_time_7",                    default: false
    t.boolean  "lesson_time_8",                    default: false
    t.boolean  "lesson_time_9",                    default: false
    t.boolean  "lesson_time_10",                   default: false
    t.boolean  "lesson_time_11",                   default: false
    t.boolean  "lesson_time_12",                   default: false
    t.boolean  "lesson_time_13",                   default: false
    t.boolean  "lesson_time_14",                   default: false
    t.boolean  "lesson_time_15",                   default: false
    t.boolean  "lesson_time_16",                   default: false
    t.boolean  "lesson_time_17",                   default: false
    t.boolean  "lesson_time_18",                   default: false
    t.boolean  "lesson_time_19",                   default: false
    t.boolean  "lesson_time_20",                   default: false
    t.boolean  "lesson_time_21",                   default: false
    t.boolean  "lesson_time_22",                   default: false
    t.boolean  "lesson_time_23",                   default: false
    t.boolean  "lesson_time_24",                   default: false
    t.boolean  "lesson_time_25",                   default: false
    t.boolean  "lesson_time_26",                   default: false
    t.boolean  "lesson_time_27",                   default: false
    t.boolean  "lesson_time_28",                   default: false
    t.boolean  "lesson_time_29",                   default: false
    t.boolean  "lesson_time_30",                   default: false
    t.boolean  "lesson_time_31",                   default: false
    t.boolean  "lesson_time_32",                   default: false
    t.boolean  "lesson_time_33",                   default: false
    t.boolean  "lesson_time_34",                   default: false
    t.boolean  "lesson_time_35",                   default: false
    t.boolean  "lesson_time_36",                   default: false
    t.boolean  "lesson_time_37",                   default: false
    t.boolean  "lesson_time_38",                   default: false
    t.boolean  "lesson_time_39",                   default: false
    t.boolean  "lesson_time_40",                   default: false
    t.boolean  "lesson_time_41",                   default: false
    t.boolean  "lesson_time_42",                   default: false
    t.boolean  "lesson_time_43",                   default: false
    t.boolean  "lesson_time_44",                   default: false
    t.boolean  "lesson_time_45",                   default: false
    t.boolean  "lesson_time_46",                   default: false
    t.boolean  "lesson_time_47",                   default: false
    t.boolean  "lesson_time_48",                   default: false
    t.string   "lesson_time_other"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lesson_time_pertinent_index",      default: 0
    t.string   "lesson_time_pertinent"
  end

  add_index "publisher_product_lesson_times", ["publisher_id"], name: "index_lesson_time_on_publisher_id", using: :btree
  add_index "publisher_product_lesson_times", ["publisher_product_id"], name: "index_lesson_time_on_publisher_product_id", using: :btree

  create_table "publisher_product_logos", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  add_index "publisher_product_logos", ["publisher_id"], name: "index_publisher_product_logos_on_publisher_id", using: :btree
  add_index "publisher_product_logos", ["publisher_product_id"], name: "index_publisher_product_logos_on_publisher_product_id", using: :btree

  create_table "publisher_product_market_targets", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.integer  "publisher_product_description_id"
    t.boolean  "market_target_1",                  default: false
    t.boolean  "market_target_2",                  default: false
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

  create_table "publisher_product_platforms", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.integer  "publisher_product_description_id"
    t.boolean  "platform_1",                       default: false
    t.boolean  "platform_2",                       default: false
    t.boolean  "platform_3",                       default: false
    t.boolean  "platform_4",                       default: false
    t.boolean  "platform_5",                       default: false
    t.boolean  "platform_6",                       default: false
    t.boolean  "platform_7",                       default: false
    t.boolean  "platform_8",                       default: false
    t.boolean  "platform_9",                       default: false
    t.boolean  "platform_10",                      default: false
    t.boolean  "platform_11",                      default: false
    t.boolean  "platform_12",                      default: false
    t.boolean  "platform_13",                      default: false
    t.boolean  "platform_14",                      default: false
    t.boolean  "platform_15",                      default: false
    t.boolean  "platform_16",                      default: false
    t.boolean  "platform_17",                      default: false
    t.boolean  "platform_18",                      default: false
    t.boolean  "platform_19",                      default: false
    t.boolean  "platform_20",                      default: false
    t.boolean  "platform_21",                      default: false
    t.boolean  "platform_22",                      default: false
    t.boolean  "platform_23",                      default: false
    t.boolean  "platform_24",                      default: false
    t.boolean  "platform_25",                      default: false
    t.boolean  "platform_26",                      default: false
    t.boolean  "platform_27",                      default: false
    t.boolean  "platform_28",                      default: false
    t.boolean  "platform_29",                      default: false
    t.boolean  "platform_30",                      default: false
    t.boolean  "platform_31",                      default: false
    t.boolean  "platform_32",                      default: false
    t.boolean  "platform_33",                      default: false
    t.boolean  "platform_34",                      default: false
    t.boolean  "platform_35",                      default: false
    t.boolean  "platform_36",                      default: false
    t.boolean  "platform_37",                      default: false
    t.boolean  "platform_38",                      default: false
    t.boolean  "platform_39",                      default: false
    t.boolean  "platform_40",                      default: false
    t.boolean  "platform_41",                      default: false
    t.boolean  "platform_42",                      default: false
    t.boolean  "platform_43",                      default: false
    t.boolean  "platform_44",                      default: false
    t.boolean  "platform_45",                      default: false
    t.boolean  "platform_46",                      default: false
    t.boolean  "platform_47",                      default: false
    t.boolean  "platform_48",                      default: false
    t.boolean  "platform_49",                      default: false
    t.boolean  "platform_50",                      default: false
    t.string   "platform_other"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_product_platforms", ["publisher_id"], name: "index_platform_on_publisher_id", using: :btree
  add_index "publisher_product_platforms", ["publisher_product_id"], name: "index_platform_on_publisher_product_id", using: :btree

  create_table "publisher_product_prices", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.integer  "publisher_product_description_id"
    t.boolean  "price_1",                                                  default: false
    t.decimal  "price_1_dec",                      precision: 8, scale: 2, default: 0.0
    t.boolean  "price_2",                                                  default: false
    t.decimal  "price_2_dec",                      precision: 8, scale: 2, default: 0.0
    t.boolean  "price_3",                                                  default: false
    t.decimal  "price_3_dec",                      precision: 8, scale: 2, default: 0.0
    t.boolean  "price_4",                                                  default: false
    t.decimal  "price_4_dec",                      precision: 8, scale: 2, default: 0.0
    t.boolean  "price_5",                                                  default: false
    t.decimal  "price_5_dec",                      precision: 8, scale: 2, default: 0.0
    t.boolean  "price_6",                                                  default: false
    t.decimal  "price_6_dec",                      precision: 8, scale: 2, default: 0.0
    t.boolean  "price_7",                                                  default: false
    t.decimal  "price_7_dec",                      precision: 8, scale: 2, default: 0.0
    t.boolean  "price_8",                                                  default: false
    t.decimal  "price_8_dec",                      precision: 8, scale: 2, default: 0.0
    t.boolean  "price_9",                                                  default: false
    t.decimal  "price_9_dec",                      precision: 8, scale: 2, default: 0.0
    t.boolean  "price_10",                                                 default: false
    t.decimal  "price_10_dec",                     precision: 8, scale: 2, default: 0.0
    t.boolean  "price_11",                                                 default: false
    t.decimal  "price_11_dec",                     precision: 8, scale: 2, default: 0.0
    t.boolean  "price_12",                                                 default: false
    t.decimal  "price_12_dec",                     precision: 8, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_product_prices", ["publisher_id"], name: "index_price_on_publisher_id", using: :btree
  add_index "publisher_product_prices", ["publisher_product_id"], name: "index_price_on_publisher_product_id", using: :btree

  create_table "publisher_product_pricing_models", force: true do |t|
    t.integer  "publisher_id"
    t.integer  "publisher_product_id"
    t.integer  "publisher_product_description_id"
    t.boolean  "pricing_model_1",                  default: false
    t.boolean  "pricing_model_2",                  default: false
    t.boolean  "pricing_model_3",                  default: false
    t.boolean  "pricing_model_4",                  default: false
    t.boolean  "pricing_model_5",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_product_pricing_models", ["publisher_id"], name: "index_pricing_model_on_publisher_id", using: :btree
  add_index "publisher_product_pricing_models", ["publisher_product_id"], name: "index_pricing_model_on_publisher_product_id", using: :btree

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

  create_table "publisher_profile_images", force: true do |t|
    t.integer  "user_id"
    t.integer  "publisher_id"
    t.string   "image"
    t.string   "image_name"
    t.boolean  "primary",      default: false
    t.integer  "order",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publisher_profile_images", ["publisher_id"], name: "index_publisher_profile_images_on_publisher_id", unique: true, using: :btree
  add_index "publisher_profile_images", ["user_id"], name: "index_publisher_profile_images_on_user_id", unique: true, using: :btree

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
    t.string   "zip"
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
    t.string   "email",                  limit: 50, default: ""
    t.string   "username",               limit: 50
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "has_account",                       default: false
    t.string   "name_first",             limit: 50
    t.string   "name_last",              limit: 50
    t.integer  "bd_day",                            default: 0
    t.integer  "bd_month",                          default: 0
    t.integer  "bd_year",                           default: 0
    t.integer  "gender",                            default: 0
    t.integer  "account_type",                      default: 0
    t.string   "account_type_text"
    t.string   "bd_month_text"
    t.string   "gender_text"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "avatar"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
