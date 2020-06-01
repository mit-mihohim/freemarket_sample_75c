require 'rails_helper'

describe Item_image do
  describe '#create' do

    it "item_imageがない場合は登録できないこと" do
      item_image = build(:item_image, src: nil)
      item_image.valid?
      expect(item_image.errors[:src]).to include("を入力してください")
    end
  end
end