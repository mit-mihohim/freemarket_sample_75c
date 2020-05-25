class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :items_images, dependent: :destroy
end
