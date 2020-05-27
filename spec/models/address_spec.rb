require 'rails_helper'

describe Address do

  describe '#create' do

    it "last_name, first_name, last_name_kana, first_name_kana, post_number, prefecture_id, city, house_number, user_idが存在すれば登録できること" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "building_name, phone_numberが存在しなくても、必須のカラムが全て存在すれば登録できること" do
      address = build(:address, building_name: nil, phone_number: nil)
      expect(address).to be_valid
    end

    it "last_nameが存在しない場合は登録できないこと" do
      address = build(:address, last_name: nil)
      address.valid?
      expect(address.errors[:last_name]).to include("を入力してください")
    end

    it "first_nameが存在しない場合は登録できないこと" do
      address = build(:address, first_name: nil)
      address.valid?
      expect(address.errors[:first_name]).to include("を入力してください")
    end

    it "last_name_kanaが存在しない場合は登録できないこと" do
      address = build(:address, last_name_kana: nil)
      address.valid?
      expect(address.errors[:last_name_kana]).to include("を入力してください")
    end

    it "first_name_kanaが存在しない場合は登録できないこと" do
      address = build(:address, first_name_kana: nil)
      address.valid?
      expect(address.errors[:first_name_kana]).to include("を入力してください")
    end

    it "post_numberが存在しない場合は登録できないこと" do
      address = build(:address, post_number: nil)
      address.valid?
      expect(address.errors[:post_number]).to include("を入力してください")
    end

    it "prefecture_idが存在しない場合は登録できないこと" do
      address = build(:address, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("を入力してください")
    end

    it "cityが存在しない場合は登録できないこと" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "house_numberが存在しない場合は登録できないこと" do
      address = build(:address, house_number: nil)
      address.valid?
      expect(address.errors[:house_number]).to include("を入力してください")
    end

    it "last_nameが全角でない場合は登録できないこと" do
      address = build(:address, last_name: "Tanaka")
      address.valid?
      expect(address.errors[:last_name]).to include("は全角で入力して下さい")
    end

    it "first_nameが全角でない場合は登録できないこと" do
      address = build(:address, first_name: "Tarou")
      address.valid?
      expect(address.errors[:first_name]).to include("は全角で入力して下さい")
    end

    it "last_name_kanaが全角カタカナでない場合は登録できないこと" do
      address = build(:address, last_name_kana: "ﾀﾅｶ")
      address.valid?
      expect(address.errors[:last_name_kana]).to include("はカタカナ（全角）で入力して下さい")
    end

    it "first_name_kanaが全角カタカナでない場合は登録できないこと" do
      address = build(:address, first_name_kana: "ﾀﾛｳ")
      address.valid?
      expect(address.errors[:first_name_kana]).to include("はカタカナ（全角）で入力して下さい")
    end

    it "郵便番号に数字とハイフン以外が入力されている場合は登録できないこと" do
      address = build(:address, post_number: "hoge")
      address.valid?
      expect(address.errors[:post_number]).to include("は不正な値です")
    end

    it "郵便番号が数字とハイフンのみであっても、桁数が正しくない場合は登録できないこと" do
      address = build(:address, post_number: "1234-5678")
      address.valid?
      expect(address.errors[:post_number]).to include("は不正な値です")
    end

    it "電話番号に数字以外が入力されている場合は登録できないこと" do
      address = build(:address, phone_number: "hoge")
      address.valid?
      expect(address.errors[:phone_number]).to include("は不正な値です")
    end

    it "電話番号が数字のみであっても、桁数が正しくない場合は登録できないこと" do
      address = build(:address, phone_number: "090")
      address.valid?
      expect(address.errors[:phone_number]).to include("は不正な値です")
    end

  end

end