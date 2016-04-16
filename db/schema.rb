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

ActiveRecord::Schema.define(version: 20160416223822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "points", force: :cascade do |t|
    t.integer "value"
    t.integer "user_id"
  end

  add_index "points", ["user_id"], name: "index_points_on_user_id", using: :btree

  create_table "rewards", force: :cascade do |t|
    t.string  "name"
    t.integer "value"
  end

  create_table "user_rewards", force: :cascade do |t|
    t.integer "user_id"
    t.integer "reward_id"
  end

  add_index "user_rewards", ["reward_id"], name: "index_user_rewards_on_reward_id", using: :btree
  add_index "user_rewards", ["user_id"], name: "index_user_rewards_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string  "username"
    t.string  "password_digest"
    t.string  "password_confirmation"
    t.integer "role"
  end

  add_foreign_key "points", "users"
  add_foreign_key "user_rewards", "rewards"
  add_foreign_key "user_rewards", "users"
end
