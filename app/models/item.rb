class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :category
  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User', optional: :true
  has_many :favorites, dependent: :destroy
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  validates :name, :text, :item_images, :price, :status, :delivery_charge_bearer, :prefecture_id, :delivery_days, presence: true
  enum delivery_days: {"1日〜2日で発送":1, "2日〜3日で発送": 2, "3日〜4日で発送": 3, "4日〜7日で発送":4 }, _prefix: true
  enum delivery_charge_bearer: {"送料込み（出品者負担）":1, "着払い（購入者負担）":2} ,_prefix: true
  enum status: {"新品、未使用":1, "未使用に近い":2, "目立った傷や汚れなし":3, "やや傷や汚れあり":4, "傷や汚れあり":5, "全体的に状態が悪い":6} ,_prefix: true

  def previous
    Item.where("id < ?", self.id).where(buyer_id: nil).order("id DESC").first
  end
  
  def next
    Item.where("id > ?", self.id).where(buyer_id: nil).order("id ASC").first
  end

  def self.search(search)
    return Item.all unless search
    Item.where('name LIKE(?)', "%#{search}%")
  end
end
