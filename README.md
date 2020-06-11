# 接続先情報
## Basic認証
- [FURIMA](http://www.freemarket-sample-75c.work/)
- ID: admin
- PW: password
## テストユーザー等
- 出品者用アカウント
  - ID: test1@mail.com
  - PW: 1234567
- 購入者用アカウント
  - ID: test2@mail.com
  - PW: 1234567
- 購入者用クレジットカード情報
  - カード番号: 4012888888881881
  - 有効期限: 12/24
  - セキュリティコード: 123  

## 動作確認方法
- Chromeの最新版を利用してアクセスしてください。
  - 接続先およびログイン情報については、上記の通りです。
  - テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品→出品
  - 確認後、ログアウト処理をお願いします。
  
# アプリ概要
TECH::CAMP最終課題（チーム開発）として作成したフリマサイトのクローンアプリです。
実際にあるサイトを確認しながら、DB設計、要件定義、UI、UX設計に至るまで全て自分達で実装しました。
実装で詰まった場合は、公式ドキュメントや、参考サイトを確認しながらチームメンバー主体で解決しながら実装しました。
毎日3回のデイリースクラムで日々の進捗確認や実装方針の確認などを行ってきました。
１週間に1回のスプリントレビューで達成できた箇所や反省点などの振り返りを行い、次回スプリントレビューまでの目標を再設定することにより、開発スピードを上げてきました。
##### 開発期間: 約３週間
##### 一日当たりの開発時間: 10〜12時間
##### 開発手法: スクラムを用いたアジャイル開発
##### 実装機能一覧
- ユーザー新規登録、ログイン機能（ウィザード形式）
- 商品出品機能、編集、削除機能
- 商品検索機能
- カテゴリ一覧、検索機能
- 商品購入機能（API Pay.jp使用）
- いいね機能
- パンくず機能
- SNS認証機能
- 単体テスト（バリデーションチェック）
##### 使用技術
- 開発環境
  - Ruby/Ruby on Rails/Haml/Scss/JavaScript/Jquery/MySQL/Github/Visual Studio Code
- 本番環境
  - AWS(EC2 , S3)/Unicorn/Nginx/MySQL/Capistrano

# 開発担当箇所
  #### DB設計
    - 必要なテーブル、カラムの選定
    - アソシエーションの決定
    - ER図の作成
	  - 各種制約の決


  ### 本番環境への
  
  
  
  
  
  
  
  
  
  
  
# データベース設計

# ER図
![人生を変えるフリマアプリ ](https://user-images.githubusercontent.com/64117340/84116768-6622ca00-aa6b-11ea-850e-a8dd3f7cb662.png)

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|text|text|null: false|
|brand|string||
|status|integer|null:false, dafault: 0|
|delivery_charge_bearer|integer|null:false, dafault: 0|
|prefecture_id|integer|null: false, dafault: 0|
|dalivery_days|integer|null:false, dafault: 0|
|price|integer|null:false|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true|
|category_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :category
- has_many :item_images, dependent: :destroy

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### gem指定
gem ancestry
### Association
- has_many :items
- has_ancestry

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :item

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_one :profile, dependent: :destroy
- has_one :user_address, dependent: :destroy
- has_one :payment_card, dependent: :destroy
- has_many :items, dependent: :destroy, foreign_key: :items
- has_many :sns_credentials, dependent: :destroy

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null:false|
|family_name_furigana|string|null:false|
|first_name_furigana|string|null: false|
|birthday|date|null:false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null:false|
|family_name_kana|string|null:false|
|first_name_kana|string|null: false|
|post_number|string|null:false|
|prefecture_id|integer|null:false, dafault: 0|
|city|string|null:false|
|house_number|integer|null: false|
|building_name|string||
|phone_number|string||
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## payment_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|string|null:false|
### Association
- belongs_to :user

## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string||
|uid|string||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user, optional: true

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|-----|
|item_id|references|-----|
### Association
- has_many :favorites, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_many :favorite_items, through: :favorites, source: :item
  
