# bc-diary

- ruby version  : 2.5.0
- rails version : 5.2.3

# やること
## クローン
```
git clone git@github.com:ryohei-aoki-GA/bc_diary_public.git
cd bc_diary_public
bundle install
```
リポジトリ名をプライベートリポジトリと変えているので、プライベートリポジトリでコード管理をするようになったら、新たにgit cloneする方向で。

## データベース作成
```
rails db:create
rails db:migrate
```
テスト環境はまだ未整備。seedも
