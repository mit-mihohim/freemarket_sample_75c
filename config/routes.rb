Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  devise_scope :user do
    get'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  
  root 'items#index'
  resources :items, only: [:index, :new, :create] 
  get 'items/buy',  to: 'items#buy'
  resources :users, only: :show

end
