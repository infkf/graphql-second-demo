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

ActiveRecord::Schema.define(version: 2021_10_07_154306) do

  create_table "badges", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "badges_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "badge_id"
    t.index ["badge_id"], name: "index_badges_users_on_badge_id"
    t.index ["user_id"], name: "index_badges_users_on_user_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.integer "user_id"
    t.text "message", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "user_relationships", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "followee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followee_id"], name: "index_user_relationships_on_followee_id"
    t.index ["follower_id", "followee_id"], name: "index_user_relationships_on_follower_id_and_followee_id", unique: true
    t.index ["follower_id"], name: "index_user_relationships_on_follower_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "handle", null: false
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest", null: false
    t.index ["handle"], name: "index_users_on_handle", unique: true
  end

  add_foreign_key "user_relationships", "users", column: "followee_id"
  add_foreign_key "user_relationships", "users", column: "follower_id"
end
