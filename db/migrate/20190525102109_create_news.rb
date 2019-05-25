class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string     :title, null: false, comment: "ニュースタイトル"
      t.text       :content, null: false, comment: "ニュース内容"
      t.references :user, comment: "アドミンユーザーの誰が投稿したか"
      t.references :news_category, comment: "ニュースカテゴリ"

      t.timestamps
    end
  end
end
