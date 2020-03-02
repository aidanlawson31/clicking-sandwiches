Rails.application.routes.draw do

  root 'pages#home'
  devise_for :users
  resources  :businesses
  resources  :menu_items
  resources  :categories

  resources :locations do
    member do
      get    'show_menus'
      post   'add_menus'
      post   'add_image'
      delete 'remove_menu'
      delete 'remove_image'
    end
  end

  resources :menus do
    member do
      get 'sort_menu_items_categories'
      post 'save_sort_menu_items_categories'
    end
  end
end

#Example routes

# namespace :admin do
#   resources :organizations do
#     member do
#       get 'use'
#     end
#   end

#   resources :auctions do
#     member do
#       get 'copy_url'
#       get 'payment_requests'
#     end

#     resources :bidders, only: [:index] do
#       member do
#         get 'block'
#         get 'unblock'
#         get 'payment_request'
#       end
#     end

#     resources :auction_items do
#       member do
#         get 'copy'
#       end
#     end
#   end

#   resources :donation_pages do
#     member do
#       get 'copy_url'
#       get 'cancel_update'
#     end
#   end

#   resources :raffles do
#     member do
#       get 'copy_url'
#       get 'cancel_update'
#     end

#     resources :raffle_bundles do
#       member do
#         get 'copy'
#       end
#     end

#     resources :raffle_prizes do
#       member do
#         get 'copy'
#         get 'pick_winner'
#         get 'notify_winner'
#       end
#     end
#   end
