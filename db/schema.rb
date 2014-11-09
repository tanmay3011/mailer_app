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

ActiveRecord::Schema.define(version: 20141109213515) do

  create_table "attachments", force: true do |t|
    t.string   "filename"
    t.string   "content"
    t.string   "type"
    t.integer  "email_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["email_id"], name: "index_attachments_on_email_id", using: :btree

  create_table "contacts", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "phone_no"
    t.integer  "mailbox_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["mailbox_id"], name: "index_contacts_on_mailbox_id", using: :btree

  create_table "emails", force: true do |t|
    t.integer  "mailbox_id"
    t.integer  "email_id"
    t.integer  "receiver_count"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "subject"
    t.integer  "priority"
  end

  add_index "emails", ["email_id"], name: "index_emails_on_email_id", using: :btree
  add_index "emails", ["mailbox_id"], name: "index_emails_on_mailbox_id", using: :btree

  create_table "entries", force: true do |t|
    t.text     "description"
    t.integer  "log_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["log_id"], name: "index_entries_on_log_id", using: :btree

  create_table "friends", force: true do |t|
    t.integer  "contact_id"
    t.string   "firstname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mailbox_id"
  end

  add_index "friends", ["contact_id"], name: "index_friends_on_contact_id", using: :btree
  add_index "friends", ["mailbox_id"], name: "index_friends_on_mailbox_id", using: :btree

  create_table "logs", force: true do |t|
    t.integer  "mailbox_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "logs", ["mailbox_id"], name: "index_logs_on_mailbox_id", using: :btree

  create_table "mailboxes", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sent_emails_count"
  end

  create_table "receivers", force: true do |t|
    t.integer  "email_id"
    t.integer  "mailbox_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "receivers", ["email_id"], name: "index_receivers_on_email_id", using: :btree
  add_index "receivers", ["mailbox_id"], name: "index_receivers_on_mailbox_id", using: :btree

end
