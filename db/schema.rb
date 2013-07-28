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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130613122441) do

  create_table "articles", :force => true do |t|
    t.string   "article"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "articles", ["article"], :name => "index_articles_on_article", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true

  create_table "nouns", :force => true do |t|
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "notes"
    t.integer  "article_id"
    t.string   "english"
    t.string   "german"
    t.string   "plural"
  end

  add_index "nouns", ["category_id"], :name => "index_nouns_on_category_id"
  add_index "nouns", ["english", "german"], :name => "index_nouns_on_english_and_german", :unique => true

  create_table "quizzes", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sentences", :force => true do |t|
    t.string   "english"
    t.string   "german"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "literal_translation"
    t.string   "notes"
  end

  add_index "sentences", ["created_at"], :name => "index_sentences_on_created_at", :unique => true

end
