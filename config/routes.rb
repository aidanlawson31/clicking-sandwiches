Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  resources :locations
  resources :businesses
  resources :menus
  resources :categories
  resources :menu_items
end
