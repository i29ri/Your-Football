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

ActiveRecord::Schema.define(version: 2021_01_28_084031) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_accounts_on_reset_password_token", unique: true
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "match_day"
    t.integer "home_goal"
    t.integer "away_goal"
    t.integer "home_points"
    t.integer "away_points"
    t.string "stadium_name"
    t.boolean "is_held", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "season"
    t.integer "section"
  end

  create_table "pickteams", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preview_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.integer "preview_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preview_favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "preview_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "previews", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.integer "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "review_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.integer "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "review_favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.integer "match_id"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_relationships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "match_id"
    t.integer "team_id"
    t.boolean "home_flg", default: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "follow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follow_id"], name: "index_user_relationships_on_follow_id"
    t.index ["user_id", "follow_id"], name: "index_user_relationships_on_user_id_and_follow_id", unique: true
    t.index ["user_id"], name: "index_user_relationships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "yourfoot_ID"
    t.string "nickname"
    t.string "profile_image_id"
    t.text "introduction"
    t.boolean "is_deleted", default: false
    t.boolean "admin", default: false
    t.boolean "admin_flg"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
