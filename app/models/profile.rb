class Profile < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :birthday
  end
end
