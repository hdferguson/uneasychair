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

ActiveRecord::Schema.define(version: 20170329160154) do

  create_table "accounts", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "accountable_type"
    t.integer  "accountable_id"
    t.index ["accountable_type", "accountable_id"], name: "index_accounts_on_accountable_type_and_accountable_id"
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "committees", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "conference_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["conference_id"], name: "index_committees_on_conference_id"
    t.index ["user_id"], name: "index_committees_on_user_id"
  end

  create_table "conferences", force: :cascade do |t|
    t.string   "name"
    t.integer  "chairid"
    t.boolean  "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "papers", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "attachment"
    t.integer  "conference_id"
    t.integer  "committee_id"
    t.integer  "authorid"
    t.decimal  "rating"
    t.boolean  "accepted"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["committee_id"], name: "index_papers_on_committee_id"
    t.index ["conference_id"], name: "index_papers_on_conference_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "score"
    t.integer  "confidence"
    t.text     "comments"
    t.integer  "paper_id"
    t.integer  "memberid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paper_id"], name: "index_reviews_on_paper_id"
  end

  create_table "super_accounts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "role"
    t.integer  "conference_id"
    t.integer  "committee_id"
    t.integer  "userid"
    t.boolean  "capproved"
    t.boolean  "uapproved"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["committee_id"], name: "index_tracks_on_committee_id"
    t.index ["conference_id"], name: "index_tracks_on_conference_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
