class CreateArticleCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :article_categories do |t|
      t.string :name, null: false, limit: 256, comment: "カテゴリ名"
      t.string :description, null: false, limit: 256, comment: "カテゴリ説明"
      t.string :image_url, comment: "カテゴリアイコン"

      t.timestamps
    end
  end
end
