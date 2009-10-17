# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091017182729) do

  create_table "listings", :force => true do |t|
    t.integer  "supplier_id"
    t.integer  "wine_id"
    t.string   "supplier_side_wine_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "address"
    t.string   "store_url"
    t.string   "affiliate_code"
    t.string   "supplier_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

  create_table "wines", :force => true do |t|
    t.string   "name"
    t.string   "region"
    t.integer  "vintage"
    t.string   "variety"
    t.string   "wine_type"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "producer"
    t.string   "country"
    t.string   "appellation"
    t.string   "style"
    t.string   "colour"
    t.boolean  "sparkling"
    t.string   "bottle_size"
    t.text     "tasting_notes"
    t.string   "barcode"
  end

end
