Rails.application.routes.draw do
  devise_for :users, controllers: {
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
      patch 'update_profile', 'update_address'
    end
  end
 
  root 'items#index'

  get 'items/buy',  to: 'items#buy'
  resources :payment_cards, only: [:new, :create, :index, :destroy]
  resources :items 
  
  resources :categories, only: :index do
    collection do
      get "children_category"
      get "grandchildren_category"
    end
  end
end
