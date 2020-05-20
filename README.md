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

