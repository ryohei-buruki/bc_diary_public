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

ActiveRecord::Schema.define(version: 2019_05_25_102109) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_categories", force: :cascade do |t|
    t.string "name", limit: 256, null: false, comment: "カテゴリ名"
    t.string "description", limit: 256, null: false, comment: "カテゴリ説明"
    t.string "image_url", comment: "カテゴリアイコン"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.text "content", null: false, comment: "日記内容"
    t.bigint "article_category_id"
    t.bigint "diary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_category_id"], name: "index_articles_on_article_category_id"
    t.index ["diary_id"], name: "index_articles_on_diary_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content", limit: 256, null: false, comment: "コメント内容"
    t.integer "parent_comment_id", null: false, comment: "コンテンツのコメント>0、コメントへのコメント>コメントのID"
    t.bigint "user_id"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "diaries", force: :cascade do |t|
    t.string "title", limit: 256
    t.datetime "date", precision: 6, null: false, comment: "何月何日のdiayか"
    t.boolean "is_published", null: false, comment: "下書きならfalse、公開ならtrue"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_diaries_on_user_id"
  end

  create_table "kept_diaries", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "diary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diary_id"], name: "index_kept_diaries_on_diary_id"
    t.index ["user_id"], name: "index_kept_diaries_on_user_id"
  end

  create_table "news", force: :cascade do |t|
    t.string "title", null: false, comment: "ニュースタイトル"
    t.text "content", null: false, comment: "ニュース内容"
    t.bigint "user_id", comment: "アドミンユーザーの誰が投稿したか"
    t.bigint "news_category_id", comment: "ニュースカテゴリ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["news_category_id"], name: "index_news_on_news_category_id"
    t.index ["user_id"], name: "index_news_on_user_id"
  end

  create_table "news_categories", force: :cascade do |t|
    t.string "name", limit: 256, null: false, comment: "ニュースカテゴリ名"
    t.string "description", null: false, comment: "ニュースカテゴリ説明"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "read_histories", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "diary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diary_id"], name: "index_read_histories_on_diary_id"
    t.index ["user_id"], name: "index_read_histories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false, comment: "ユーザー名"
    t.string "last_name", null: false, comment: "ユーザー制"
    t.string "email", null: false, comment: "メールアドレス"
    t.string "image_url", comment: "ユーザーアイコン"
    t.string "profile", limit: 256, comment: "ユーザープロフィール"
    t.string "department", comment: "所属部署名"
    t.string "workplace", null: false, comment: "勤務地"
    t.boolean "is_valid", default: false, null: false, comment: "有効アカウント識別子"
    t.boolean "is_admin", default: false, null: false, comment: "管理者アカウント識別子"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "articles", "article_categories"
  add_foreign_key "articles", "diaries"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
  add_foreign_key "diaries", "users"
  add_foreign_key "kept_diaries", "diaries"
  add_foreign_key "kept_diaries", "users"
  add_foreign_key "read_histories", "diaries"
  add_foreign_key "read_histories", "users"
end
