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

ActiveRecord::Schema.define(version: 20150417102446) do

  create_table "activities", force: :cascade do |t|
    t.string   "title",            null: false
    t.integer  "learning_unit_id"
    t.text     "description",      null: false
    t.integer  "max_grade"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "activities", ["learning_unit_id"], name: "index_activities_on_learning_unit_id"
  add_index "activities", ["title"], name: "index_activities_on_title"

  create_table "bootsy_image_galleries", force: :cascade do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "bootsy_images", force: :cascade do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "courses", ["title"], name: "index_courses_on_title"

  create_table "courses_users", id: false, force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "user_id",   null: false
  end

  add_index "courses_users", ["course_id"], name: "index_courses_users_on_course_id"
  add_index "courses_users", ["user_id"], name: "index_courses_users_on_user_id"

  create_table "learning_units", force: :cascade do |t|
    t.string   "title",      null: false
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "learning_units", ["course_id"], name: "index_learning_units_on_course_id"
  add_index "learning_units", ["title"], name: "index_learning_units_on_title"

  create_table "submissions", force: :cascade do |t|
    t.integer  "files_id"
    t.integer  "author_id"
    t.integer  "activity_id"
    t.string   "comment"
    t.integer  "grade"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "submissions", ["activity_id"], name: "index_submissions_on_activity_id"
  add_index "submissions", ["author_id"], name: "index_submissions_on_author_id"
  add_index "submissions", ["files_id"], name: "index_submissions_on_files_id"

  create_table "upload_files", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "activity_id"
    t.integer  "submission_id"
    t.string   "file",          null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "upload_files", ["activity_id"], name: "index_upload_files_on_activity_id"
  add_index "upload_files", ["author_id"], name: "index_upload_files_on_author_id"
  add_index "upload_files", ["file"], name: "index_upload_files_on_file"
  add_index "upload_files", ["submission_id"], name: "index_upload_files_on_submission_id"

  create_table "users", force: :cascade do |t|
    t.string   "password_digest"
    t.string   "login",                             null: false
    t.string   "email",                             null: false
    t.string   "role",            default: "guest", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["login"], name: "index_users_on_login"
  add_index "users", ["role"], name: "index_users_on_role"

end
