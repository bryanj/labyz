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

ActiveRecord::Schema.define(:version => 20120901173319) do

  create_table "links", :force => true do |t|
    t.integer  "question_id"
    t.integer  "next_question_id"
    t.string   "answer"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "logs", :force => true do |t|
    t.integer  "world_id"
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "questions", :force => true do |t|
    t.integer  "world_id"
    t.string   "title"
    t.string   "content"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "questions", ["uid"], :name => "index_questions_on_uid"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_salt"
    t.string   "password_hash"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "worlds", :force => true do |t|
    t.string   "name"
    t.string   "first_uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end