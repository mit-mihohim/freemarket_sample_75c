FactoryBot.define do

  factory :address do
    user
    last_name           {"田中"}
    first_name          {"太郎"}
    last_name_kana      {"タナカ"}
    first_name_kana     {"タロウ"}
    post_number         {"123-4567"}
    prefecture_id       {13}
    city                {"横浜市緑区"}
    house_number        {"青山1-1-1"}
    building_name       {"柳ビル103"}
    phone_number        {"09012345678"}
  end

end