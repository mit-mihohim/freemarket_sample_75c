Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  devise_scope :user do
    get'addresses', to: 'users/registrations#new_address'
    get 'create_addresses', to: 'users/registrations#create_address' # 機能実装時は、post 'addresses' に書き換える
  end
  

  root 'items#index'
  resources :items, only: [:new, :index]
end
