FactoryBot.define do

  factory :profile do
    user
    last_name           {"田中"}
    first_name          {"太郎"}
    last_name_kana      {"タナカ"}
    first_name_kana     {"タロウ"}
    birthday            {2000-01-01}
  end

end