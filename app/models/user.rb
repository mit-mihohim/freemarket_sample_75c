class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item" #userが買った商品
  has_many :selling_items, -> { where("buyer_id is NULL")}, foreign_key: "seller_id", class_name: "Item" #現在売っている商品
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item" #userが既に売った商品
end
