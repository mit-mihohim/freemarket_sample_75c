# データベース設計

# ER図
![人生を変えるフリマアプリ](https://github.com/Jun-Honda-0326/freemarket_sample_75c/issues/2)

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
|main_image|string|null:false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :item_sub_images
- has_many :item_categories
- has_many :categories, through: :item_categories


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :item_categories
- has_many :items, through: :item_categories


## item_sub_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## item_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :category


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_one :profile
- has_one :user_address
- has_one :payment_card
- has_many :items


## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null:false|
|family_name_furigana|string|null:false|
|first_name_furigana|string|null: false|
|birth_year|integer|null:false, default: 0|
|birth_month|integer|null:false, default: 0|
|birth_date|integer|null:false, default: 0|
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
|post_number|integer|null:false|
|prefecture|integer|null:false, dafault: 0|
|city|string|null:false|
|house_number|integer|null: false|
|building_name|string||
|phone_number|integer||
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