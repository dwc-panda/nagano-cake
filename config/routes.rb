Rails.application.routes.draw do


  namespace :admins do
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
  	# root to: 'homes#top'
  end

  scope module: :customers do
  	devise_for :end_users, controllers: {
      sessions: 'customers/end_users/sessions',
      registrations: 'customers/end_users/registrations',
      passwords: 'customers/end_users/passwords'
    }
  	resources :end_users
  	resources :items, only: [:index, :show]
  	resources :cart_items, only: [:index, :create, :destroy, :update]
  	delete 'cart_items/empty' => 'cart_items#empty', as: :empty
  	resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
  	resources :orders, only: [:index, :new, :create, :show]
  	post 'orders/confirm' => 'orders#confirm', as: :confirm
  	get 'orders/thanks' => 'orders#thanks', as: :thanks
  	# root to: 'homes#top'
  	get 'homes/about' => 'homes#about', as: :about
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
