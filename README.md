# データベース設計

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
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
|user_id|references|foreign_key: true|

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

## item_sub_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|item_id|references|foreign_key: true|

## item_categorysテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|category_id|references|foreign_key: true|

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|

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
|user_id|references|foreign_key: true|

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
|user_id|references|foreign_key: true|

## payment_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|customer_id|string|null:false|