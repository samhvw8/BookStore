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

ActiveRecord::Schema.define(version: 20170526181411) do

  create_table "author_readings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "author_id"
    t.string   "reading_type"
    t.integer  "reading_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["author_id"], name: "index_author_readings_on_author_id", using: :btree
    t.index ["reading_type", "reading_id"], name: "index_author_readings_on_reading_type_and_reading_id", using: :btree
  end

  create_table "authors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "bio",        limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "parent_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id", using: :btree
  end

  create_table "category_readings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category_id"
    t.string   "reading_type"
    t.integer  "reading_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["category_id"], name: "index_category_readings_on_category_id", using: :btree
    t.index ["reading_type", "reading_id"], name: "index_category_readings_on_reading_type_and_reading_id", using: :btree
  end

  create_table "chapters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "reading_type"
    t.integer  "reading_id"
    t.string   "no"
    t.string   "title"
    t.integer  "viewed",       default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["reading_type", "reading_id"], name: "index_chapters_on_reading_type_and_reading_id", using: :btree
  end

  create_table "comics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "contents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "chapter_id"
    t.string   "content_element_type"
    t.integer  "content_element_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["chapter_id"], name: "index_contents_on_chapter_id", using: :btree
    t.index ["content_element_type", "content_element_id"], name: "index_contents_on_content_element_type_and_content_element_id", using: :btree
  end

  create_table "image_contents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "novels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "reading_type"
    t.integer  "reading_id"
    t.text     "review",       limit: 65535
    t.decimal  "vote",                       precision: 3, scale: 1
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.index ["reading_type", "reading_id"], name: "index_reviews_on_reading_type_and_reading_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "subscribes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "reading_type"
    t.integer  "reading_id"
    t.integer  "current_chap_id"
    t.integer  "newest_chap_id"
    t.boolean  "available",       default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["current_chap_id"], name: "index_subscribes_on_current_chap_id", using: :btree
    t.index ["newest_chap_id"], name: "index_subscribes_on_newest_chap_id", using: :btree
    t.index ["reading_type", "reading_id"], name: "index_subscribes_on_reading_type_and_reading_id", using: :btree
    t.index ["user_id"], name: "index_subscribes_on_user_id", using: :btree
  end

  create_table "text_contents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "txt_content", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "is_admin",        default: false
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
