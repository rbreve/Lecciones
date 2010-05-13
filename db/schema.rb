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

ActiveRecord::Schema.define(:version => 20100512050651) do

  create_table "admins", :force => true do |t|
    t.string   "email",                             :default => "", :null => false
    t.string   "encrypted_password", :limit => 128, :default => "", :null => false
    t.string   "password_salt",                     :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ambitos", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "empresarial_sectors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ifis", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.integer  "country_id"
    t.integer  "lcountry_id"
    t.integer  "lessons_count"
  end

  create_table "ifisectorizations", :force => true do |t|
    t.integer  "ifi_id"
    t.integer  "productive_sector_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lcountries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leccion_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lesson_countries", :force => true do |t|
    t.integer  "lesson_id"
    t.integer  "lcountry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lesson_esectors", :force => true do |t|
    t.integer  "lesson_id"
    t.integer  "empresarial_sector_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lesson_products", :force => true do |t|
    t.integer  "lesson_id"
    t.integer  "producto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lesson_psectors", :force => true do |t|
    t.integer  "lesson_id"
    t.integer  "productive_sector_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lesson_results", :force => true do |t|
    t.integer  "lesson_id"
    t.integer  "resultado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.boolean  "isprivate"
    t.integer  "ambito_id"
    t.integer  "ifi_id"
    t.integer  "leccion_type_id"
    t.integer  "level_id"
    t.integer  "origin_id"
    t.integer  "resultado_id"
    t.integer  "producto_id"
    t.integer  "empresarial_sector_id"
    t.integer  "productive_sector_id"
    t.integer  "lcountry_id"
    t.integer  "user_id"
    t.datetime "updated_at"
    t.boolean  "aprobada"
  end

  create_table "levels", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "origins", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "productive_sectors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "productos", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resultados", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sector_empresarials", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "name"
    t.integer  "country_id"
    t.integer  "ifi_id"
    t.string   "tipo"
    t.boolean  "ispublic"
    t.string   "institucion"
  end

end
