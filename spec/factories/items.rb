FactoryBot.define do

  factory :item  do
    name                     {"カメラ"}
    text                     {"すごく使いやすい"}
    status                   {"新品、未使用"}
    delivery_charge_bearer   {"送料込み（出品者負担）"}
    shipping_area            {"アメリカ"}
    delivery_days            {"1日〜2日で発送"}
    price                    {10000}
    category_id              {300}
  end
end







