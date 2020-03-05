Rails.application.routes.draw do

  root 'pages#home'
  devise_for :users
  resources  :businesses

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
      get   'sort_menu_categories'
      patch 'save_sort_menu_categories'
    end

    resources :categories do
      member do
        get   'sort_category_menu_items'
        patch 'save_sort_category_menu_items'
      end

      resources :menu_items
    end
  end
end
