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

ActiveRecord::Schema.define(version: 20170523100610) do

  create_table "authors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.text     "bio",        limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "authors_books", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "author_id", null: false
    t.integer "book_id",   null: false
    t.index ["book_id", "author_id"], name: "index_authors_books_on_book_id_and_author_id", unique: true, using: :btree
  end

  create_table "books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "title"
    t.decimal  "price",                     precision: 10, scale: 2
    t.integer  "qty"
    t.text     "description", limit: 65535
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "image"
  end

  create_table "books_categories", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "category_id", null: false
    t.integer "book_id",     null: false
    t.index ["book_id", "category_id"], name: "index_books_categories_on_book_id_and_category_id", unique: true, using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "parent_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["book_id"], name: "index_comments_on_book_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "order_books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "order_id"
    t.integer  "book_id"
    t.integer  "qty"
    t.decimal  "price",      precision: 10, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["book_id"], name: "index_order_books_on_book_id", using: :btree
    t.index ["order_id"], name: "index_order_books_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.boolean  "is_checkout", default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.text     "review",     limit: 65535
    t.decimal  "vote",                     precision: 3, scale: 1
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.index ["book_id"], name: "index_reviews_on_book_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "subscribes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.boolean  "availabe",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["book_id"], name: "index_subscribes_on_book_id", using: :btree
    t.index ["user_id"], name: "index_subscribes_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "is_admin",        default: false
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
