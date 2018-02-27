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

ActiveRecord::Schema.define(version: 20180227101540) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "all_notices", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id"
    t.boolean "notice"
    t.boolean "all_notice"
    t.boolean "comment_permission", default: true
    t.boolean "title_tag_permission", default: true
    t.string "user_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_all_notices_on_deleted_at"
  end

  create_table "bulletins", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "user_id"
    t.string "user_name"
    t.boolean "search_job", default: false
    t.boolean "seeking_job", default: false
    t.boolean "info_no_named", default: false
    t.boolean "info_room_trade", default: false
    t.boolean "info_trade", default: false
    t.boolean "promote_store", default: false
    t.boolean "vote", default: false
    t.boolean "seeking_room", default: false
    t.boolean "main_hidden", default: false
    t.boolean "member_boss", default: false
    t.boolean "member_univ", default: false
    t.boolean "member_real_estate", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.boolean "admin_only"
    t.index ["deleted_at"], name: "index_bulletins_on_deleted_at"
  end

  create_table "comment_destroys", force: :cascade do |t|
    t.integer "user_id"
    t.integer "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comment_destroys_on_comment_id"
    t.index ["user_id"], name: "index_comment_destroys_on_user_id"
  end

  create_table "comment_qnas", force: :cascade do |t|
    t.integer "qna_id"
    t.text "body"
    t.string "user_name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.index ["cached_votes_down"], name: "index_comment_qnas_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_comment_qnas_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_comment_qnas_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_comment_qnas_on_cached_votes_up"
    t.index ["cached_weighted_average"], name: "index_comment_qnas_on_cached_weighted_average"
    t.index ["cached_weighted_score"], name: "index_comment_qnas_on_cached_weighted_score"
    t.index ["cached_weighted_total"], name: "index_comment_qnas_on_cached_weighted_total"
    t.index ["deleted_at"], name: "index_comment_qnas_on_deleted_at"
    t.index ["qna_id"], name: "index_comment_qnas_on_qna_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "nickname"
    t.text "body"
    t.string "remote_ip"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.string "title"
    t.string "user_name"
    t.integer "num"
    t.string "subject"
    t.integer "user_id", null: false
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "bulletin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.datetime "deleted_at"
    t.index ["cached_votes_down"], name: "index_comments_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_comments_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_comments_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_comments_on_cached_votes_up"
    t.index ["cached_weighted_average"], name: "index_comments_on_cached_weighted_average"
    t.index ["cached_weighted_score"], name: "index_comments_on_cached_weighted_score"
    t.index ["cached_weighted_total"], name: "index_comments_on_cached_weighted_total"
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
    t.index ["deleted_at"], name: "index_comments_on_deleted_at"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "identities", force: :cascade do |t|
    t.integer "user_id"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "alt"
    t.string "hint"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "impressions", force: :cascade do |t|
    t.string "impressionable_type"
    t.integer "impressionable_id"
    t.integer "user_id"
    t.string "controller_name"
    t.string "action_name"
    t.string "view_name"
    t.string "request_hash"
    t.string "ip_address"
    t.string "session_hash"
    t.text "message"
    t.text "referrer"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index"
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "new_notifications", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_new_notifications_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "num"
    t.integer "user_id"
    t.string "user_name"
    t.boolean "notice", default: false
    t.string "location"
    t.integer "phone_num"
    t.string "etc"
    t.string "remote_ip"
    t.string "image"
    t.boolean "agree", default: false
    t.string "short_talk"
    t.string "skill"
    t.string "time"
    t.integer "price_job"
    t.integer "person"
    t.string "nickname"
    t.string "room_select"
    t.integer "deposit"
    t.string "scale"
    t.integer "price_room"
    t.string "contract_day"
    t.string "sns"
    t.string "vender"
    t.string "trade_way"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bulletin_id"
    t.integer "impressions_count"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.datetime "deleted_at"
    t.index ["bulletin_id"], name: "index_posts_on_bulletin_id"
    t.index ["cached_votes_down"], name: "index_posts_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_posts_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_posts_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_posts_on_cached_votes_up"
    t.index ["cached_weighted_average"], name: "index_posts_on_cached_weighted_average"
    t.index ["cached_weighted_score"], name: "index_posts_on_cached_weighted_score"
    t.index ["cached_weighted_total"], name: "index_posts_on_cached_weighted_total"
    t.index ["deleted_at"], name: "index_posts_on_deleted_at"
  end

  create_table "qnas", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "num"
    t.integer "user_id"
    t.string "user_name"
    t.boolean "notice", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.integer "impressions_count"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.index ["cached_votes_down"], name: "index_qnas_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_qnas_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_qnas_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_qnas_on_cached_votes_up"
    t.index ["cached_weighted_average"], name: "index_qnas_on_cached_weighted_average"
    t.index ["cached_weighted_score"], name: "index_qnas_on_cached_weighted_score"
    t.index ["cached_weighted_total"], name: "index_qnas_on_cached_weighted_total"
    t.index ["deleted_at"], name: "index_qnas_on_deleted_at"
  end

  create_table "read_marks", force: :cascade do |t|
    t.string "readable_type", null: false
    t.integer "readable_id"
    t.string "reader_type", null: false
    t.integer "reader_id"
    t.datetime "timestamp"
    t.index ["readable_type", "readable_id"], name: "index_read_marks_on_readable_type_and_readable_id"
    t.index ["reader_id", "reader_type", "readable_type", "readable_id"], name: "read_marks_reader_readable_index", unique: true
    t.index ["reader_type", "reader_id"], name: "index_read_marks_on_reader_type_and_reader_id"
  end

  create_table "report_comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_report_comments_on_comment_id"
    t.index ["user_id"], name: "index_report_comments_on_user_id"
  end

  create_table "report_qnas", force: :cascade do |t|
    t.integer "user_id"
    t.integer "qna_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["qna_id"], name: "index_report_qnas_on_qna_id"
    t.index ["user_id"], name: "index_report_qnas_on_user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_reports_on_post_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "nickname", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.boolean "comment_auto_open", default: true
    t.boolean "manage_agree", default: false
    t.string "do_say", default: "", null: false
    t.string "profile_select", default: "profile_normal"
    t.string "profile_icon"
    t.string "profile_banner"
    t.string "transfer", default: "경춘선"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "votes", force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["votable_type", "votable_id"], name: "index_votes_on_votable_type_and_votable_id"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
    t.index ["voter_type", "voter_id"], name: "index_votes_on_voter_type_and_voter_id"
  end

end
