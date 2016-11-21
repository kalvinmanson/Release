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

ActiveRecord::Schema.define(version: 20161121042448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
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

  create_table "books", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "slug"
    t.string   "author"
    t.string   "publisher"
    t.string   "collection"
    t.integer  "pages"
    t.string   "isbn_10"
    t.string   "isbn_13"
    t.text     "abstract"
    t.string   "lang"
    t.integer  "condition"
    t.boolean  "stock"
    t.integer  "price"
    t.string   "tags"
    t.integer  "quality"
    t.integer  "followers_count",    default: 0
    t.integer  "likers_count",       default: 0
    t.integer  "mentioners_count",   default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.index ["slug"], name: "index_books_on_slug", unique: true, using: :btree
    t.index ["user_id"], name: "index_books_on_user_id", using: :btree
  end

  create_table "books_genders", id: false, force: :cascade do |t|
    t.integer "gender_id", null: false
    t.integer "book_id",   null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_categories_on_slug", unique: true, using: :btree
  end

  create_table "cities", force: :cascade do |t|
    t.integer  "country_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "post_id"
    t.integer  "user_id"
    t.integer  "parent_id"
    t.text     "content"
    t.integer  "likers_count", default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["book_id"], name: "index_comments_on_book_id", using: :btree
    t.index ["post_id"], name: "index_comments_on_post_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "country_code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "follows", force: :cascade do |t|
    t.string   "follower_type"
    t.integer  "follower_id"
    t.string   "followable_type"
    t.integer  "followable_id"
    t.datetime "created_at"
    t.index ["followable_id", "followable_type"], name: "fk_followables", using: :btree
    t.index ["follower_id", "follower_type"], name: "fk_follows", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "genders", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "name_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_genders_on_slug", unique: true, using: :btree
  end

  create_table "likes", force: :cascade do |t|
    t.string   "liker_type"
    t.integer  "liker_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
    t.index ["likeable_id", "likeable_type"], name: "fk_likeables", using: :btree
    t.index ["liker_id", "liker_type"], name: "fk_likes", using: :btree
  end

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.string  "unsubscriber_type"
    t.integer "unsubscriber_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
    t.index ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree
  end

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.string   "sender_type"
    t.integer  "sender_id"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.string   "notified_object_type"
    t.integer  "notified_object_id"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
    t.index ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
    t.index ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
    t.index ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
    t.index ["type"], name: "index_mailboxer_notifications_on_type", using: :btree
  end

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.string   "receiver_type"
    t.integer  "receiver_id"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "is_delivered",               default: false
    t.string   "delivery_method"
    t.string   "message_id"
    t.index ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
    t.index ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree
  end

  create_table "mentions", force: :cascade do |t|
    t.string   "mentioner_type"
    t.integer  "mentioner_id"
    t.string   "mentionable_type"
    t.integer  "mentionable_id"
    t.datetime "created_at"
    t.index ["mentionable_id", "mentionable_type"], name: "fk_mentionables", using: :btree
    t.index ["mentioner_id", "mentioner_type"], name: "fk_mentions", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
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

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_orders_on_book_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "paymments", force: :cascade do |t|
    t.integer  "user_id"
    t.float    "ammount"
    t.float    "shipping"
    t.float    "cost"
    t.text     "info_products"
    t.text     "info_paymment"
    t.text     "info_shipping"
    t.boolean  "state_payed"
    t.boolean  "state_shipped"
    t.boolean  "state_take"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_paymments_on_user_id", using: :btree
  end

  create_table "pictures", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.integer  "post_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.index ["book_id"], name: "index_pictures_on_book_id", using: :btree
    t.index ["post_id"], name: "index_pictures_on_post_id", using: :btree
    t.index ["user_id"], name: "index_pictures_on_user_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "book_id"
    t.integer  "user_id"
    t.string   "name"
    t.string   "slug"
    t.text     "content"
    t.text     "description"
    t.string   "tags"
    t.integer  "followers_count",  default: 0
    t.integer  "likers_count",     default: 0
    t.integer  "mentioners_count", default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["book_id"], name: "index_posts_on_book_id", using: :btree
    t.index ["category_id"], name: "index_posts_on_category_id", using: :btree
    t.index ["slug"], name: "index_posts_on_slug", unique: true, using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "ranks", force: :cascade do |t|
    t.integer  "paymment_id"
    t.integer  "user_id"
    t.text     "comment"
    t.integer  "rank"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["paymment_id"], name: "index_ranks_on_paymment_id", using: :btree
    t.index ["user_id"], name: "index_ranks_on_user_id", using: :btree
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.integer  "book_id"
    t.integer  "post_id"
    t.string   "caracter"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reports_on_book_id", using: :btree
    t.index ["comment_id"], name: "index_reports_on_comment_id", using: :btree
    t.index ["post_id"], name: "index_reports_on_post_id", using: :btree
    t.index ["user_id"], name: "index_reports_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.integer  "city_id"
    t.string   "name"
    t.string   "slug"
    t.string   "avatar"
    t.string   "rol",                    default: "User"
    t.float    "rank"
    t.string   "gender"
    t.date     "bithdate"
    t.boolean  "banned"
    t.date     "banned_date"
    t.boolean  "active"
    t.integer  "followees_count",        default: 0
    t.integer  "followers_count",        default: 0
    t.integer  "likees_count",           default: 0
    t.integer  "likers_count",           default: 0
    t.integer  "mentionees",             default: 0
    t.integer  "mentioners_count",       default: 0
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "provider"
    t.string   "uid"
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
  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
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
