テックキャンプの最終課題（チーム開発）にて作成したフリマアプリについて紹介します自身で実装した箇所、および開発を通じて得られた経験についても紹介します。

# 接続先情報
## Basic認証
- [FURIMA](http://www.freemarket-sample-75c.work/)
- ID: admin
- PW: password
## テストユーザー等
- 出品者用アカウント
  - メールアドレス: test1@mail.com
  - パスワード: 1234567
- 購入者用アカウント
  - メールアドレス: test2@mail.com
  - パスワード: 1234567
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

## 開発担当箇所
## 担当箇所一覧と確認方法
- DB設計
- トップページ(アプリ紹介、商品一覧)(フロントエンド)
  - http://www.freemarket-sample-75c.work にアクセスするとご覧いただけます。
  
![トップページ](https://user-images.githubusercontent.com/64117340/85493144-5087d580-b611-11ea-9ac1-25db085833f7.gif)

- 商品詳細ページ(フロント/バックエンド)
  - トップページ(未ログイン時、下部)の商品一覧に表示されている商品をクリックして頂くと、商品詳細ページをご覧いただけます。

![商品詳細](https://user-images.githubusercontent.com/64117340/85493251-86c55500-b611-11ea-918d-2b4d394ae4d8.gif)

- カテゴリー機能(フロント/バックエンド)
  - ヘッダーの「カテゴリーより探す」よりカテゴリー一覧ページへ遷移できます。

![カテゴリー一覧](https://user-images.githubusercontent.com/64117340/85493363-bd02d480-b611-11ea-9150-40b655d73f8f.gif)

  - ログイン後、右下の出品ボタンを押して頂くと、出品画面に遷移し、カテゴリー選択項目にてご覧いただけます。
  
![カテゴリー選択](https://user-images.githubusercontent.com/64117340/85493351-b6745d00-b611-11ea-89d7-a08807690f26.gif)


- SNS認証ユーザー登録/ログイン実装(バックエンド)
  - 新規登録、ログイン画面よりご確認いただけます。

<img width="1440" alt="SNS認証" src="https://user-images.githubusercontent.com/64117340/85493668-46b2a200-b612-11ea-936a-64702b7513ff.png">

### 各担当箇所の詳細
#### DB設計
#####　概要
  - 必要なテーブル、カラムの選定
  - アソシエーションの決定
#### 担当内容
  - ER図の作成
  - categories、payment_cardsテーブルの設計
  - アソシエーションの構築

#### トップページ(アプリ紹介、商品一覧)
##### 概要
  - トップページ/商品一覧ページ
  - 未ログイン時は、アプリ紹介が上部に表示される仕様
#### 担当内容（フロントエンド）
  - haml,scssを使用しトップページのマークアップ作業
  - アプリ内scssリファクタリング

#### 商品詳細ページ
##### 概要
  - 商品詳細ページ作成
##### 担当内容（フロントエンド）
  - 商品詳細ページのマークアップ
  - 全登録情報の表示
  - 詳細ページより次の商品へ遷移できる
##### 担当内容（バックエンド）
  - ルーティング設定
  - コントローラーアクション定義
  - レコード抽出メソッド追加

#### カテゴリー機能
##### 概要
  - 階層構造のカテゴリー機能を作成
  - テーブル作成、モデルへのアソシエーション追記
##### 担当内容（フロントエンド）
  - カテゴリー一覧ページ作成
##### 担当内容（バックエンド）
  - Ruby on Railsのgem “ancestry”を使用し、親・子・孫の３階層構造のカテゴリーを作成
  - seedファイルにて、初期値をテーブルへ追加
  - カテゴリーコントローラーを作成し、階層カテゴリ呼び出しメソッドを作成
  - 出品ページにて、非同期での三階層カテゴリ選択の実装
  - カテゴリー一覧ページでの登録カテゴリをメソッドを使い表示

#### SNS認証ユーザー登録/ログイン実装
##### 概要
  - googleアカウントによるユーザー登録の実装
  - テーブル作成、モデルへのアソシエーション追記
##### 担当内容（フロントエンド）
  - ユーザー新規登録/ログイン画面へ認証規約に基づいた表示追記
##### 担当内容（バックエンド）
  - SNS-API利用設定
  - Ruby on Railsのgem “OmniAuth/omniauth-rails_csrf_protection”を使用し、APIと連携
  - sns_credentialsテーブルの作成ユーザーとのアソシエーション追加
  - コントローラーを作成し、認証後のアクションを追加
  - usersモデルで、sns認証で取得した情報を登録する為のメソッドを追記
  - SNS認証時は、パスワードをdeviseメソッドで自動生成するよう設定


### 開発を通じて得られた知見
#### 工夫した点

1. チームとして工夫を行った点

  開発開始時、DB設計に全員が携わって行った事で、アプリの概要や実装項目に到るまで必要となるスキルを共有しながら進める事ができました。また、マークアップ作業を始めに終わらせる事で、ページ遷移や、それに伴い必要となる機能を動的に確認する事ができ、バックエンド開発もスムーズに進める事ができました。
  
2. 個人として工夫を行った点

  ユーザビリティを重視し、トップページのログイン時・未ログイン時でviewを変更をしたり、詳細ページから一覧表示に戻ることなく、次の商品へ遷移を可能にしたりと、ユーザーの使いやすさを常に考えながらの開発を心がけました。また、コードの可読性や将来的な追加項目を踏まえ、カテゴリー追加時の注釈を加えたり、scssのリファクタリングを行ったり、他者が見てもすぐに理解できるコーディングを行いました。

#### 苦労した点

1. チームとして苦労した点

  - GitHub
  
    多様な機能をチームで分担し開発をしていた為、開発ブランチで作業中にマスターブランチが更新される事で発生するマージ時のコンフリクトや、実装順により開発が進められない状況になる事などが多々ありました。マージ直前でのコンフリクト解消の為、未動作確認のままマスターにマージし、結果エラーが生じるケースがありました。これらの課題を解決する為に、 rebase機能を使用し、マスターの更新を作業ブランチにリベースする事で、事前にコンフリクト解消、その他の実装済機能との連携をスムーズに取る事ができました。gitなどの便利な機能を活用しながら、円滑な開発作業をしていきたいと思います。
    
  - テーブル作成
  
    機能毎の担当開発者がテーブル作成を行っていた為、意図しない順序でマイグレーションファイルが実行されてしまい、外部キー制約によるエラーが発生しました。また、エラー解消のためにファイルを差し戻して正しい順序で再実行させる手間が生じました。マイグレーションファイルのロールバックや指定ファイル毎の実行などの手順を学ぶきっかけにはなりましたが、必須のテーブルについてはDB設計完了後、テーブル作成＋リレーション形成を初期の段階で行っていきたいと思います。


2. 個人として苦労した点

  - ライブラリ、API
  
    初めて使うライブラリやAPIを利用する際に、読み易い二次ソースに頼ってしまい、正しくない内容を参考にした結果、作業時間が大幅にかかってしまう事がありました。特にAPIでは、提供元の規約に沿った利用方法で実装する必要がある為、公式リファレンスを正しく読み解き利用する必要がある事を学びました。
    
  - JavaScript/Ajax
  
    イベント発生のタイミングや、条件による動作など、大枠のコーディングはスムーズに書く事ができたものの、条件分岐が複雑になると望んでいる動作を実現する事ができなくなりました。条件に不足があり、結果が意図しないものになってしまっていました。仮説の段階で、あらゆる動作を想定する事が必要がある事を学びました。

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
  
