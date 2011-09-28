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

ActiveRecord::Schema.define(:version => 20110511063614) do

  create_table "charities", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "charities", ["user_id"], :name => "index_charities_on_user_id"

  create_table "deeds", :force => true do |t|
    t.integer  "charity_id"
    t.integer  "sponsor_id"
    t.float    "amount"
    t.float    "price"
    t.integer  "target_amount"
    t.datetime "starts_on"
    t.datetime "ends_on"
    t.string   "status",        :default => "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deeds", ["charity_id"], :name => "index_deeds_on_charity_id"
  add_index "deeds", ["sponsor_id"], :name => "index_deeds_on_sponsor_id"

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.date     "birth_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "purchases", :force => true do |t|
    t.integer  "deed_id"
    t.string   "name"
    t.float    "amount",                                     :null => false
    t.string   "purchase_type",   :default => "credit card"
    t.integer  "donor_id"
    t.string   "address",                                    :null => false
    t.string   "city",                                       :null => false
    t.string   "state",                                      :null => false
    t.string   "zipcode",                                    :null => false
    t.string   "email",                                      :null => false
    t.string   "ip_address"
    t.string   "card_type"
    t.date     "card_expires_on"
    t.string   "status",          :default => "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["deed_id"], :name => "index_purchases_on_deed_id"
  add_index "purchases", ["donor_id"], :name => "index_purchases_on_donor_id"

  create_table "sponsors", :force => true do |t|
    t.integer  "user_id"
    t.string   "name",                              :null => false
    t.string   "address"
    t.string   "city",                              :null => false
    t.string   "state",                             :null => false
    t.string   "zipcode",                           :null => false
    t.string   "contact_name"
    t.string   "contact_phone",                     :null => false
    t.string   "business_phone"
    t.string   "logo"
    t.boolean  "is_verified",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sponsors", ["name"], :name => "index_sponsors_on_name"
  add_index "sponsors", ["state"], :name => "index_sponsors_on_state"
  add_index "sponsors", ["user_id"], :name => "index_sponsors_on_user_id"
  add_index "sponsors", ["zipcode"], :name => "index_sponsors_on_zipcode"

  create_table "spotlights", :force => true do |t|
    t.integer  "deed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spotlights", ["deed_id"], :name => "index_spotlights_on_deed_id"

  create_table "stories", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "story_by"
    t.boolean  "is_published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username",                                                 :null => false
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "zipcode"
    t.integer  "security_question"
    t.string   "security_answer"
    t.boolean  "is_admin",                              :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
