require 'rails_helper'

describe Item do
  describe '#create' do

    it "nameがない場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "textがない場合は登録できないこと" do
      item = build(:item, text: nil)
      item.valid?
      expect(item.errors[:text]).to include("を入力してください")
    end

    it "statusがない場合は登録できないこと" do
      item = build(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to include("を入力してください")
    end

    it "delivery_charge_bearerがない場合は登録できないこと" do
      item = build(:item, delivery_charge_bearer: nil)
      item.valid?
      expect(item.errors[:delivery_charge_bearer]).to include("を入力してください")
    end

    it "prefecture_idがない場合は登録できないこと" do
      item = build(:item, shipping_area: nil)
      item.valid?
      expect(item.errors[:shipping_area]).to include("を入力してください")
    end

    it "delivery_daysがない場合は登録できないこと" do
      item = build(:item, delivery_days: nil)
      item.valid?
      expect(item.errors[:delivery_days]).to include("を入力してください")
    end

    it "priceがない場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "category_idがない場合は登録できないこと" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

  end
end