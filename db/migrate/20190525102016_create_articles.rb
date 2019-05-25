class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text       :content, null: false, comment: "日記内容"
      t.references :article_category, foreign_key: true
      t.references :diary, foreign_key: true

      t.timestamps
    end
  end
end
