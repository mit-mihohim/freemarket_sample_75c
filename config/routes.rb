Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: "users/registrations"
  }
  devise_scope :user do
    get'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  

  resources :users, only: :show do
    collection do
      get 'edit_profile', 'edit_address'
      get 'sell_items'
      get 'bought_items'
      patch 'update_profile', 'update_address'
    end
  end
 
  root 'items#index'

  resources :payment_cards, only: [:new, :create, :index, :destroy]
  resources :items do
    collection do
      get 'search'
    end
    resources :purchases do
      collection do
        get :buy
        post :pay
      end
    end
  end
  resources :categories, only: :index do
    collection do
      get "children_category"
      get "grandchildren_category"
    end
  end
end