class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2, :twitter]

  has_many :sns_credentials
  has_many :items, foreign_key: "seller_id"
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item" #userが買った商品
  has_many :selling_items, -> { where("buyer_id is NULL")}, foreign_key: "seller_id", class_name: "Item" #現在売っている商品
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item" #userが既に売った商品
  has_one :profile, dependent: :destroy
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :profile
  
  has_one :payment_card, dependent: :destroy
end
