class PaymentCard < ApplicationRecord
  belongs_to :user
  validates :payjp_customer_id, presence: true
end
