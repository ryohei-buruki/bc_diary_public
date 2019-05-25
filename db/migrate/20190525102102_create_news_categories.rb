class CreateNewsCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :news_categories do |t|
      t.string :name, limit: 256, null: false, comment: "ニュースカテゴリ名"
      t.string :description, null: false, comment: "ニュースカテゴリ説明"

      t.timestamps
    end
  end
end
