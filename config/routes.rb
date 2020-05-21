Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'items/index'
  get 'items/buy'
  root 'items#index'
end
