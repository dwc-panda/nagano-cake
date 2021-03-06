Rails.application.routes.draw do


  namespace :admins do
    root to: 'homes#top'
    devise_for :users, controllers: {
      sessions: 'admins/users/sessions',
      registrations: 'admins/users/registrations',
      passwords: 'admins/users/passwords'
    }
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
    resources :end_users, only: [:index, :show, :edit, :update]
  end

  scope module: :customers do
    root to: 'homes#top'
    devise_for :end_users, controllers: {
      sessions: 'customers/end_users/sessions',
      registrations: 'customers/end_users/registrations',
      passwords: 'customers/end_users/passwords'
    }
    resources :end_users
    get 'end_users/:id/confirm' => 'end_users#confirm', as: :end_user_confirm
    patch 'end_users/:id/withdrawal' => 'end_users#withdrawal', as: :withdrawal
    resources :items, only: [:index, :show]
    delete 'cart_items/empty' => 'cart_items#empty', as: :empty
    resources :cart_items, only: [:index, :create, :destroy, :update]
    resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
    get 'orders/thanks' => 'orders#thanks', as: :thanks
    post 'orders/confirm' => 'orders#confirm', as: :order_confirm
    resources :orders, only: [:index, :new, :create, :show]
    get 'homes/about' => 'homes#about', as: :about
    get 'genres/:id' => 'genres#search', as: :search
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
