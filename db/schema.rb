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

ActiveRecord::Schema.define(version: 20161002174913) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "phone"
    t.string   "movil"
    t.string   "address"
    t.string   "address_detail"
    t.integer  "zipcode"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "slug"
    t.string   "author"
    t.string   "publisher"
    t.string   "collection"
    t.integer  "pages"
    t.string   "isbn_10"
    t.string   "isbn_13"
    t.text     "abstract",   limit: 65535
    t.string   "lang"
    t.integer  "condition"
    t.boolean  "stack"
    t.integer  "price"
    t.string   "tags"
    t.integer  "quality"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["slug"], name: "index_books_on_slug", unique: true, using: :btree
    t.index ["user_id"], name: "index_books_on_user_id", using: :btree
  end

  create_table "books_genders", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "gender_id", null: false
    t.integer "book_id",   null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_categories_on_slug", unique: true, using: :btree
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "country_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "book_id"
    t.integer  "post_id"
    t.integer  "user_id"
    t.integer  "parent_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_comments_on_book_id", using: :btree
    t.index ["post_id"], name: "index_comments_on_post_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "country_code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "genders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "name_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_genders_on_slug", unique: true, using: :btree
  end

  create_table "notifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "rank_id"
    t.integer  "paymment_id"
    t.integer  "book_id"
    t.string   "caracter"
    t.string   "content"
    t.boolean  "checked"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["book_id"], name: "index_notifications_on_book_id", using: :btree
    t.index ["paymment_id"], name: "index_notifications_on_paymment_id", using: :btree
    t.index ["rank_id"], name: "index_notifications_on_rank_id", using: :btree
    t.index ["user_id"], name: "index_notifications_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_orders_on_book_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "paymments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.float    "ammount",         limit: 24
    t.float    "shipping",        limit: 24
    t.float    "cost",            limit: 24
    t.text     "detail_products", limit: 65535
    t.text     "detail_paymment", limit: 65535
    t.text     "detail_shipping", limit: 65535
    t.boolean  "state_payed"
    t.boolean  "state_shipped"
    t.boolean  "state_take"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["user_id"], name: "index_paymments_on_user_id", using: :btree
  end

  create_table "pictures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_pictures_on_book_id", using: :btree
    t.index ["post_id"], name: "index_pictures_on_post_id", using: :btree
    t.index ["user_id"], name: "index_pictures_on_user_id", using: :btree
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category_id"
    t.integer  "book_id"
    t.integer  "user_id"
    t.string   "name"
    t.string   "slug"
    t.text     "content",     limit: 65535
    t.text     "description", limit: 65535
    t.string   "tags"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["book_id"], name: "index_posts_on_book_id", using: :btree
    t.index ["category_id"], name: "index_posts_on_category_id", using: :btree
    t.index ["slug"], name: "index_posts_on_slug", unique: true, using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "ranks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "paymment_id"
    t.integer  "user_id"
    t.text     "comment",     limit: 65535
    t.integer  "rank"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["paymment_id"], name: "index_ranks_on_paymment_id", using: :btree
    t.index ["user_id"], name: "index_ranks_on_user_id", using: :btree
  end

  create_table "reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.integer  "book_id"
    t.integer  "post_id"
    t.string   "caracter"
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["book_id"], name: "index_reports_on_book_id", using: :btree
    t.index ["comment_id"], name: "index_reports_on_comment_id", using: :btree
    t.index ["post_id"], name: "index_reports_on_post_id", using: :btree
    t.index ["user_id"], name: "index_reports_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "city_id"
    t.string   "name"
    t.string   "slug"
    t.string   "avatar"
    t.string   "rol"
    t.float    "rank",                   limit: 24
    t.string   "gender"
    t.date     "bithdate"
    t.boolean  "banned"
    t.date     "banned_date"
    t.boolean  "active"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["city_id"], name: "index_users_on_city_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "books", "users"
  add_foreign_key "cities", "countries"
  add_foreign_key "comments", "books"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "notifications", "books"
  add_foreign_key "notifications", "paymments"
  add_foreign_key "notifications", "ranks"
  add_foreign_key "notifications", "users"
  add_foreign_key "orders", "books"
  add_foreign_key "orders", "users"
  add_foreign_key "paymments", "users"
  add_foreign_key "pictures", "books"
  add_foreign_key "pictures", "posts"
  add_foreign_key "pictures", "users"
  add_foreign_key "posts", "books"
  add_foreign_key "posts", "categories"
  add_foreign_key "posts", "users"
  add_foreign_key "ranks", "paymments"
  add_foreign_key "ranks", "users"
  add_foreign_key "reports", "books"
  add_foreign_key "reports", "comments"
  add_foreign_key "reports", "posts"
  add_foreign_key "reports", "users"
  add_foreign_key "users", "cities"
end
