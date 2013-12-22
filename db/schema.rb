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

ActiveRecord::Schema.define(version: 20131222163819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: true do |t|
    t.string   "terrain_type"
    t.boolean  "winner",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buildings", force: true do |t|
    t.integer  "player_id",  null: false
    t.integer  "board_id",   null: false
    t.string   "type"
    t.string   "x_cord",     null: false
    t.string   "y_cord",     null: false
    t.integer  "level"
    t.integer  "population"
    t.string   "range"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "buildings", ["board_id"], name: "index_buildings_on_board_id", using: :btree
  add_index "buildings", ["player_id"], name: "index_buildings_on_player_id", using: :btree

  create_table "games", force: true do |t|
    t.integer  "player_id",  null: false
    t.integer  "board_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["board_id"], name: "index_games_on_board_id", using: :btree
  add_index "games", ["player_id"], name: "index_games_on_player_id", using: :btree

  create_table "players", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "name",       null: false
    t.string   "kingdom"
    t.string   "crest",      null: false
    t.string   "color_one",  null: false
    t.string   "color_two"
    t.text     "manifesto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["user_id"], name: "index_players_on_user_id", using: :btree

  create_table "stats", force: true do |t|
    t.integer  "player_id",                   null: false
    t.integer  "board_id",                    null: false
    t.integer  "money",       default: 0
    t.integer  "influence",   default: 0
    t.integer  "quests",      default: 0
    t.boolean  "blood_crown", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stats", ["board_id"], name: "index_stats_on_board_id", using: :btree
  add_index "stats", ["player_id"], name: "index_stats_on_player_id", using: :btree

  create_table "tiles", force: true do |t|
    t.integer  "player_id",                  null: false
    t.integer  "board_id",                   null: false
    t.string   "x_cords",                    null: false
    t.string   "y_cords",                    null: false
    t.boolean  "territory",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tiles", ["board_id"], name: "index_tiles_on_board_id", using: :btree
  add_index "tiles", ["player_id"], name: "index_tiles_on_player_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",             null: false
    t.string   "email",            null: false
    t.string   "password_digest"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
