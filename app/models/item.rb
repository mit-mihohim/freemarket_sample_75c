class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  # belongs_to :user, optional: true
  # belongs_to :category, optional: true
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  validates :name, :text, :price, :item_images, presence: true 
  validates :status_id, :delivery_charge_bearer_id, :shipping_area, :delivery_days_id, numericality: { other_than: 0}
  enum delivery_days: {choose:0, One_Two:1, Two_Three: 2, Three_Four: 3, Four_Seven:4 }, _prefix: true
  enum delivery_charge_bearer: {choose: 0, myself:1, opponent:2 } ,_prefix: true
  enum status: {choose:0, unused:1, nearly_unused:2, not_injured:3, bit_injured:4, injured:5, bad:6} ,_prefix: true

end
