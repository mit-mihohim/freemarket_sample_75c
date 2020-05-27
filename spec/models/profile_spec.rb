require 'rails_helper'

describe Profile do

  describe '#create' do

    it "last_name, first_name, last_name_kana, first_name_kana, birthday, user_idが存在すれば登録できること" do
      profile = build(:profile)
      expect(profile).to be_valid
    end

    it "last_nameが存在しない場合は登録できないこと" do
      profile = build(:profile, last_name: nil)
      profile.valid?
      expect(profile.errors[:last_name]).to include("を入力してください")
    end

    it "first_nameが存在しない場合は登録できないこと" do
      profile = build(:profile, first_name: nil)
      profile.valid?
      expect(profile.errors[:first_name]).to include("を入力してください")
    end

    it "last_name_kanaが存在しない場合は登録できないこと" do
      profile = build(:profile, last_name_kana: nil)
      profile.valid?
      expect(profile.errors[:last_name_kana]).to include("を入力してください")
    end

    it "first_name_kanaが存在しない場合は登録できないこと" do
      profile = build(:profile, first_name_kana: nil)
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("を入力してください")
    end

    it "birthdayが存在しない場合は登録できないこと" do
      profile = build(:profile, birthday: nil)
      profile.valid?
      expect(profile.errors[:birthday]).to include("を入力してください")
    end

    it "last_nameが全角でない場合は登録できないこと" do
      profile = build(:profile, last_name: "Tanaka")
      profile.valid?
      expect(profile.errors[:last_name]).to include("は全角で入力して下さい")
    end

    it "first_nameが全角でない場合は登録できないこと" do
      profile = build(:profile, first_name: "Tarou")
      profile.valid?
      expect(profile.errors[:first_name]).to include("は全角で入力して下さい")
    end

    it "last_name_kanaが全角カタカナでない場合は登録できないこと" do
      profile = build(:profile, last_name_kana: "ﾀﾅｶ")
      profile.valid?
      expect(profile.errors[:last_name_kana]).to include("はカタカナ（全角）で入力して下さい")
    end

    it "first_name_kanaが全角カタカナでない場合は登録できないこと" do
      profile = build(:profile, first_name_kana: "ﾀﾛｳ")
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("はカタカナ（全角）で入力して下さい")
    end

  end

end