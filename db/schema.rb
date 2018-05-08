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

ActiveRecord::Schema.define(version: 20180508153559) do

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "content"
    t.integer "number"
    t.integer "views"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "suffix"
    t.index ["category_id", "number", "suffix"], name: "index_articles_on_category_id_and_number_and_suffix", unique: true
    t.index ["category_id"], name: "index_articles_on_category_id"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_categories_on_group_id"
    t.index ["title", "group_id"], name: "index_categories_on_title_and_group_id", unique: true
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_groups_on_title", unique: true
  end

  create_table "linked_articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "article_id"
    t.integer "article_a_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_a_id"], name: "index_linked_articles_on_article_a_id"
    t.index ["article_id"], name: "index_linked_articles_on_article_id"
  end

  add_foreign_key "articles", "categories"
  add_foreign_key "categories", "groups"
end
