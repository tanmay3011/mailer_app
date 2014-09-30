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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140926191208) do

  create_table "attachments", force: true do |t|
    t.string   "filename"
    t.string   "content"
    t.string   "type"
    t.integer  "maeil_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "phone_no"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friends", force: true do |t|
    t.integer  "mailbox_id"
    t.string   "firstname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maeils", force: true do |t|
    t.integer  "mailbox_id"
    t.integer  "maeil_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mailboxes", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receivers", force: true do |t|
    t.integer  "maeil_id"
    t.integer  "mailbox_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
