class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  # belongs_to :user, optional: true
  belongs_to :category, optional: true
  has_many :item_images, dependent: :destroy
  validates :delivery_days, presence: true
  enum delivery_days: {"選択して下さい": 0, "1〜2日で発送":1, "2〜3日で発送":2, "4〜7日で発送":3 }, _prefix: true
  enum delivery_charge_bearer: {"選択して下さい": 0, "送料込み（出品者負担）":1, "送料込み（購入者負担）":2}, _prefix: true
  enum status: {"選択して下さい":0, "新品、未使用":1, "未使用に近い":2, "目立った傷や汚れなし":3, "やや傷や汚れあり":4, "傷や汚れあり":5, "全体的に状態が悪い":6}, _prefix: true

end
