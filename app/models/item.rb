class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :item_images, dependent: :destroy
  validates :delivery_days, presence: true
  enum delivery_days: {"選択して下さい": 0, "1〜2日で発送":1, "2〜3日で発送":2, "4〜7日で発送":3 }, _prefix: true
  enum delivery_charge_bearers: {"選択して下さい": 0, "送料込み（出品者負担）":1, "送料込み（購入者負担）":2}, _prefix: true
 

end
