class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.string     :title, limit: 256
      t.datetime   :date, null: false, limit: 10, comment: "何月何日のdiayか"
      t.boolean    :is_published, null: false, comment: "下書きならfalse、公開ならtrue"
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
