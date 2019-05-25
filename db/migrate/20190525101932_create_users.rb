class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string  :first_name, null: false, comment: "ユーザー名"
      t.string  :last_name, null: false, comment: "ユーザー制"
      t.string  :email, null: false, comment: "メールアドレス"
      t.string  :image_url, comment: "ユーザーアイコン"
      t.string  :profile, limit: 256, comment: "ユーザープロフィール"
      t.string  :department, comment: "所属部署名"
      t.string  :workplace, null: false, comment: "勤務地"
      t.boolean :is_valid, default: false, null: false, comment: "有効アカウント識別子"
      t.boolean :is_admin, default: false, null: false, comment: "管理者アカウント識別子"

      t.timestamps
    end
  end
end
