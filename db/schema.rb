# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_28_200255) do

  create_table "games", force: :cascade do |t|
    t.integer "player_id"
    t.integer "word_id"
    t.string "status"
    t.integer "incorrect_guesses"
  end

  create_table "players", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "email_address"
  end

  create_table "words", force: :cascade do |t|
    t.string "word"
    t.string "difficulty"
    t.string "type"
    t.string "definition"
  end

end
