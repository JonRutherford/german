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

ActiveRecord::Schema.define(:version => 20131201070047) do

  create_table "articles", :force => true do |t|
    t.string   "nominative"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "articles", ["nominative"], :name => "index_articles_on_article", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true

  create_table "categorisations", :force => true do |t|
    t.integer  "category_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "sentence_part_id"
    t.string   "sentence_part_type"
  end

  add_index "categorisations", ["category_id"], :name => "index_categorisations_on_category_id"

  create_table "nouns", :force => true do |t|
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "notes"
    t.integer  "article_id"
    t.string   "english"
    t.string   "german"
    t.integer  "updated_by_id"
    t.integer  "created_by_id"
    t.integer  "pluralisation_rule_id"
  end

  add_index "nouns", ["created_by_id"], :name => "index_nouns_on_created_by_id"
  add_index "nouns", ["english", "german"], :name => "index_nouns_on_english_and_german", :unique => true
  add_index "nouns", ["updated_by_id"], :name => "index_nouns_on_updated_by_id"

  create_table "pluralisation_rules", :force => true do |t|
    t.string   "rule"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pluralisation_rules", ["rule"], :name => "index_pluralisation_rules_on_rule", :unique => true

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

  create_table "tenses", :force => true do |t|
    t.string   "first_person_singular"
    t.string   "first_person_plural"
    t.string   "second_person_informal"
    t.string   "second_person_plural"
    t.string   "second_person_plural_formal"
    t.string   "third_person_singular"
    t.string   "third_person_plural"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "name"
    t.string   "email"
    t.string   "user_name"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "admin",                  :default => false
    t.string   "remember_token"
    t.string   "password_digest"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["password_reset_token"], :name => "index_users_on_password_reset_token", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token", :unique => true
  add_index "users", ["user_name"], :name => "index_users_on_user_name", :unique => true

  create_table "verbs", :force => true do |t|
    t.integer  "updated_by_id"
    t.integer  "created_by_id"
    t.integer  "present_tense_id"
    t.integer  "infinitive_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "category_id"
  end

  add_index "verbs", ["category_id"], :name => "index_verbs_on_category_id"
  add_index "verbs", ["created_by_id"], :name => "index_verbs_on_created_by_id"
  add_index "verbs", ["infinitive_id"], :name => "index_verbs_on_infinitive_id"
  add_index "verbs", ["present_tense_id"], :name => "index_verbs_on_present_tense_id"
  add_index "verbs", ["updated_by_id"], :name => "index_verbs_on_updated_by_id"

  create_table "words", :force => true do |t|
    t.string   "english"
    t.string   "german"
    t.string   "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
