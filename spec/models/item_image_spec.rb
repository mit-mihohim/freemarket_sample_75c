require 'rails_helper'

describe ItemImage do
  describe '#create' do

    it "src(出品画像)があると登録できること" do
      item_image = build(:item_image)
      expect(item_image).to be_valid
    end

    it "src(出品画像)がない場合は登録できないこと" do
      item_image = build(:item_image, src: nil)
      item_image.valid?
      expect(item_image.errors[:src]).to include("を入力してください")
    end

  end
end