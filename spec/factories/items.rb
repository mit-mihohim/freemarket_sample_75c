FactoryBot.define do

  factory :item  do
    name                     {"カメラ"}
    text                     {"すごく使いやすい"}
    status                   {"新品、未使用"}
    delivery_charge_bearer   {"送料込み（出品者負担）"}
    shipping_area            {30}
    delivery_days            {"1日〜2日で発送"}
    price                    {10000} 

    after(:build) do |item|
      item.item_images << build(:item_image)
    end
  end
end







