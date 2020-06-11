テックキャンプの最終課題（チーム開発）にて作成したフリマアプリについて紹介します自身で実装した箇所、および開発を通じて得られた経験についても紹介します。

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
- DB設計
  - 必要なテーブル、カラムの選定
  - アソシエーションの決定
  - ER図の作成
  - 各種制約の決定

- 本番環境へのデプロイ
  - サーバーはAWS EC2インスタンスを使用しています。
  - WebサーバーにはNginx、アプリケーションサーバーにはUnicornを使用してデプロイをしています。
  - 投稿した画像についてはAWS S3に保存されるよう設定。
  - Capstranoによる自動デプロイ機能を実装しています。
  - ドメインを取得し、Route53によるドメイン関連付けを行いました。

【フロントエンド】
- トップページ（ヘッダー、フッター）
<img width="1670" alt="df6cf1d0b8f968a915aa9a2d0fa96552" src="https://user-images.githubusercontent.com/60055417/84337265-1875a100-abd4-11ea-8f05-4d9f1b003f6f.png">

![c5a371f722bcec58c135af0865e4dce9](https://user-images.githubusercontent.com/60055417/84338534-4c9e9100-abd7-11ea-8fa6-5cea94244bf0.jpg)

- 購入内容確認ページ

<img width="1021" alt="5b749d866801c4c0cecd956ef7d15dae" src="https://user-images.githubusercontent.com/60055417/84337341-4955d600-abd4-11ea-8705-b79be2596e32.png">

【サーバーサイド】
- 商品出品機能
  - 実装概要
    - 商品出品ページで商品を出品（DBに保存）できるようにしました。
    - 商品出品画像については複数枚投稿できる必要があるため画像については別モデルを作成し、商品モデルにネストさせる形で実装しました。
    - JavaScriptを用いて投稿画像のプレビュー機能を実装しました。
    - 配送地域の情報などの静的データについてはenumやactive_hashを使って実装しました。

  - 実装において苦労した点
    - enumやactive_hashにより静的なデータを扱う際のバリデーションの設定
    - JavaScriptを使った画像プレビュー機能が難しかったですが、これを機会に理解を深めれたと思います。	
    - 単体テストでネストさせたモデルなども含めてテストする必要があったので、factory_botなどの記載方法がカリキュラムに記載されている内容では実装できなかったので、公式ドキュメントなどを参照しながら実装しました。

- ユーザーマイページ（一部）

<img width="1455" alt="92c121c494b4fd32a84e26240c7ae7a7" src="https://user-images.githubusercontent.com/60055417/84338178-6390b380-abd6-11ea-95a8-438108970589.png">

    - 実装概要
      - ユーザーが出品した商品、購入した商品、いいねした商品を最新順に5件ずつ一覧表示させています。
      - 出品した商品及び購入した商品については商品テーブルにseller_idとbuyer_idをそれぞれ設定し、条件付きアソシエーションによりデータをDBから取り出しました。
      - 出品した商品のなかで、売り切れた商品は「SOLD_OUT」、いいねした商品で購入済みの商品については「購入済み」と表示させるなどして、視覚的に商品の状況がわかるように実装しました。
    - 実装において苦労した点
      - 一覧表示させる際に、商品の購入状況や、出品者かどうかにより条件分岐で表示を変更させた点
      - 条件付きアソシエーションにより購入した商品を取り出すコードを記述するのに苦労しましたが、アソシエーション理解が深まったと思います。

- いいね機能

<img width="1049" alt="9ff0eb11d37bafaaa5dcc567d3c5c1e5" src="https://user-images.githubusercontent.com/60055417/84338381-d26e0c80-abd6-11ea-83e8-daa418c6de84.png">

  - 実装概要
    - いいね機能を非同期通信により実装しています。
    - 商品モデルとユーザーを結び付けるための中間テーブルを作成し、ユーザーがいいねした商品を取り出せるようにアソシエーションを組みました。
    - 自分で出品した商品及び、ログインしていないユーザーはいいね機能が使えないよう条件分岐を設定しました。
    - いいね数については誰でも確認できるようにトップページでも表示させています。

- 商品検索機能
  - 実装概要
    - トップページの検索窓で商品名をあいまい検索できる機能を実装しました。

###  開発を通じて得られた知見

#### 工夫した点
- 自分が思っている意見はしっかり言ったこと。最初はあまり自分の意見を主張しない方が良いと思ったこともありましたが、自分の意見をチームメンバーに伝えることにより、議論が活発になったり、開発方針が固まったこともあったので、結果としては良かったと思っています。
- 実装中に詰まった場合はチームメンバーにコードを共有し一緒に考えました。ほとんどの問題についてはこの方法で解決することができました。

#### 苦労した点
- 実装に詰まった際、ネットで参考記事を検索した時に大量に記事がヒットするので、どの情報にアクセスすれば最短で問題解決するかを取捨選択するのが難しかったですが、開発を通して自分で検索してエラーなどを解決する検索力などについては養われたと思います。

#### 今後の課題
- クラスの命名初め、コードのリファクタリングを意識しつつ可読性に優れたコードが書けるようになること。
- テストコードへの理解やN＋1問題を発生させないなど、保守性の高いサービス開発ができるようになること。

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
  
