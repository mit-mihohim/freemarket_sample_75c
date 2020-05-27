class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :payment_card, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :profile
end
