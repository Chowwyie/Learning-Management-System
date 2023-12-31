# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_221_126_000_315) do
  create_table 'announcements', force: :cascade do |t|
    t.text 'text'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id'
    t.index ['user_id'], name: 'index_announcements_on_user_id'
  end

  create_table 'evaluations', force: :cascade do |t|
    t.integer 'score', default: 0
    t.text 'evaluation'
    t.boolean 'submitted', default: false
    t.datetime 'duedate'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'presentation_id'
    t.integer 'user_id'
    t.index ['presentation_id'], name: 'index_evaluations_on_presentation_id'
    t.index ['user_id'], name: 'index_evaluations_on_user_id'
  end

  create_table 'presentations', force: :cascade do |t|
    t.string 'name'
    t.boolean 'submitted', default: false
    t.decimal 'grade'
    t.datetime 'duedate'
    t.integer 'pointvalue'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'teams', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'presentation_id'
    t.integer 'user_id'
    t.index ['presentation_id'], name: 'index_teams_on_presentation_id'
    t.index ['user_id'], name: 'index_teams_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.boolean 'admin', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'password_digest'
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  add_foreign_key 'announcements', 'users'
  add_foreign_key 'evaluations', 'presentations'
  add_foreign_key 'evaluations', 'users'
  add_foreign_key 'teams', 'presentations'
  add_foreign_key 'teams', 'users'
end
