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

ActiveRecord::Schema.define(:version => 20110826174415) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "time"
    t.text     "venue_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "venue_address1"
    t.string   "venue_address2"
    t.string   "venue_city"
    t.string   "venue_state"
    t.string   "venue_zip"
    t.string   "venue_map"
    t.string   "event_url"
  end

  create_table "members", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "about"
    t.text     "links"
    t.string   "avatar"
    t.string   "token"
    t.date     "user_since"
    t.string   "github_user_id"
    t.string   "twitter_user_id"
    t.integer  "login_count"
    t.date     "ruby_since"
    t.string   "neighborhood"
    t.boolean  "available"
    t.boolean  "show_email"
    t.boolean  "email_reminders"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "podcasts", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "video_url"
    t.string   "thumbnail_medium"
    t.integer  "size"
    t.string   "duration"
    t.date     "upload_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "thumbnail_large"
    t.string   "width"
    t.string   "height"
    t.boolean  "private_video"
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.date     "timestamp"
    t.date     "created"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
