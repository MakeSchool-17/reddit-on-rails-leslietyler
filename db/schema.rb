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

ActiveRecord::Schema.define(version: 20160309191335) do

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "note_id"
    t.string   "note_type"
    t.integer  "user_id"
  end

  add_index "comments", ["note_type", "note_id"], name: "index_comments_on_note_type_and_note_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "moderators", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "subreddit_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "points"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.integer  "subreddit_id"
    t.string   "content_type"
  end

  add_index "posts", ["subreddit_id"], name: "index_posts_on_subreddit_id"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "subreddits", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
