# Basic認証
- ID: admin
- PW: password

# データベース設計

# ER図
![人生を変えるフリマアプリ](https://user-images.githubusercontent.com/63847712/82854803-794e7980-9f44-11ea-9119-57fdc31d2728.png)

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|text|text|null: false|
|brand|string||
|status|integer|null:false, dafault: 0|
|delivery_charge_bearer|integer|null:false, dafault: 0|
|shipping_area|integer|null: false, dafault: 0|
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

### Association
- has_many :items


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