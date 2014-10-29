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

ActiveRecord::Schema.define(:version => 20141029001925) do

  create_table "items", :force => true do |t|
    t.string   "title"
    t.string   "contact"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "type_of"
    t.binary   "content",     :limit => 15728640
    t.text     "information", :limit => 15728640
  end

  create_table "poster", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "account_created",       :default => false
    t.boolean  "expo_registration",     :default => false
    t.boolean  "account_approval",      :default => false
    t.string   "password_digest"
    t.string   "password_confirmation"
    t.string   "remember_token"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "password_digest"
    t.string   "password_confirmation"
    t.string   "remember_token"
    t.boolean  "admin"
    t.integer  "email_frequency",       :default => 7
    t.boolean  "web_club_newsletter",   :default => true
    t.boolean  "research",              :default => true
    t.boolean  "jobs",                  :default => true
    t.boolean  "events",                :default => true
    t.boolean  "expo_ticket",           :default => false
    t.datetime "nextsend"
    t.boolean  "account_created",       :default => false
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
