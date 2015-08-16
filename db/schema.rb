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

ActiveRecord::Schema.define(version: 0) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "lists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "restaurant_id"
  end

  add_index "lists", ["restaurant_id"], name: "index_lists_on_restaurant_id"
  add_index "lists", ["user_id"], name: "index_lists_on_user_id"

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string  "name"
    t.string  "address"
    t.integer "price"
    t.float   "rating"
    t.string  "image_url"
    t.integer "category_id"
    t.integer "neighborhood_id"
  end

  add_index "restaurants", ["category_id"], name: "index_restaurants_on_category_id"
  add_index "restaurants", ["neighborhood_id"], name: "index_restaurants_on_neighborhood_id"

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text    "description"
    t.integer "restaurant_id"
    t.integer "user_id"
    t.boolean "recommended",   default: false
  end

  add_index "reviews", ["restaurant_id"], name: "index_reviews_on_restaurant_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string  "email"
    t.boolean "admin",           default: false
    t.string  "password_digest"
    t.string  "username"
  end

end
