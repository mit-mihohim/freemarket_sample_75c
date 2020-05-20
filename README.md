# データベース設計

# ER図
![人生を変えるフリマアプリ](https://user-images.githubusercontent.com/64117340/82398222-42342000-9a8d-11ea-992a-c7b41da54ba3.png)

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|text|text|null: false|
|brand|string||
|status|string|null:false|
|delivery_charge_bearer|string|null:false|
|shipping_area|string|null: false|
|delivery_charge_bearer|string|null:false|
|shipping_area|sring|null:false|
|dalivery_days|string|null:false|
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
|birth_year|date|null:false|
|birth_month|date|null:false|
|birth_date|date|null:false|
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
|prefecture|string|null:false|
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