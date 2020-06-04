crumb :root do
  link "フリマ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user)
end

crumb :sell_items do
  link "出品した商品", sell_items_users_path
  parent :mypage
end

crumb :bought_items do
  link "購入した商品", bought_items_users_path
  parent :mypage
end

crumb :edit_address do
  link "発送元・お届け先住所変更", edit_address_users_path
  parent :mypage
end

crumb :edit_user do
  link "メール/パスワード", edit_user_registration_path
  parent :mypage
end

crumb :edit_profile do
  link "本人情報", edit_profile_users_path
  parent :mypage
end