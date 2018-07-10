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

ActiveRecord::Schema.define(version: 2018_07_10_092110) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_ratings", force: :cascade do |t|
    t.integer "rating_value"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["book_id"], name: "index_book_ratings_on_book_id"
    t.index ["user_id"], name: "index_book_ratings_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "review"
    t.integer "book_rating"
    t.integer "review_rating"
    t.date "publication_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "book_image_file_name"
    t.string "book_image_content_type"
    t.integer "book_image_file_size"
    t.datetime "book_image_updated_at"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "review_comments", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["book_id"], name: "index_review_comments_on_book_id"
    t.index ["user_id"], name: "index_review_comments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "time_zone"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "book_ratings", "books"
  add_foreign_key "book_ratings", "users"
  add_foreign_key "books", "users"
  add_foreign_key "review_comments", "books"
  add_foreign_key "review_comments", "users"
end
