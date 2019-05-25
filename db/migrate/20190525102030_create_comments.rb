class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string     :content, limit: 256, null: false, comment: "コメント内容"
      t.integer    :parent_comment_id, null: false, comment: "コンテンツのコメント>0、コメントへのコメント>コメントのID"
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
