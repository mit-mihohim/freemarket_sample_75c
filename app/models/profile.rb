class Profile < ApplicationRecord
  belongs_to :user

  FULL_WIDTH_REGEX = /\A[ぁ-んァ-ン一-龥]/
  FULL_WIDTH_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, presence: true 
  validates :last_name, :first_name, format: { with: FULL_WIDTH_REGEX, message: "は全角で入力して下さい" }
  validates :last_name_kana, :first_name_kana, format: { with: FULL_WIDTH_KANA_REGEX, message: "はカタカナ（全角）で入力して下さい" }

end
