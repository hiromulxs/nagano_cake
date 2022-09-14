Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get 'customers/mypage' => 'customers#show'
    get 'customers/mypage/edit' => 'customers#edit'
    patch 'customers/mypage/withdrawal' => 'customers#withdrawal', as: 'withdrawal_customer'
    patch 'customers/mypage' => 'customers#update', as: 'update_customer'
    get 'customers/mypage/withdraw' => 'customers#withdraw', as: 'withdraw_customer'

    resources :addresses, only: [:index, :create, :edit, :update, :destroy]

    resources :items, only: [:index, :show]

    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart/items/destroy_all' => 'cart_items#destroy_all'

    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, only: [:index, :new, :create, :show]
  end

  namespace :admin do
    root to: 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_items, only: [:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
