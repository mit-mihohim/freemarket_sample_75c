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

crumb :favorite_items do
  link "いいね! した商品一覧", bought_items_users_path
  parent :mypage
end

crumb :edit_address do
  link "発送元・お届け先住所変更", edit_address_users_path
  parent :mypage
end

crumb :payment_method do
  link "支払い方法", payment_cards_path
  parent :mypage
end

crumb :new_payment_card do
  link "クレジットカード情報入力", new_payment_card_path
  parent :payment_method
end

crumb :edit_user do
  link "メール/パスワード", edit_user_registration_path
  parent :mypage
end

crumb :edit_profile do
  link "本人情報", edit_profile_users_path
  parent :mypage
end

crumb :category_index do
  link "カテゴリー一覧", categories_path
end

crumb :parent_category do |category|
  category = Category.find(params[:id]).root
  link "#{category.name}", category_path(category)
  parent :category_index
end

crumb :child_category do |category|
  category = Category.find(params[:id])
  if category.has_children?
    link "#{category.name}", category_path(category)
    parent :parent_category
  else
    link "#{category.parent.name}", category_path(category.parent)
    parent :parent_category
  end
end

crumb :grandchild_category do |category|
  category = Category.find(params[:id])
  link "#{category.name}", category_path(category)
  parent :child_category
end