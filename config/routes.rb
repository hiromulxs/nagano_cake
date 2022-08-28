Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

    root to: 'public/homes#top'
    get '/about' => 'public/homes#about'
    get 'customers/mypage' => 'public/customers#show'
    get 'customers/mypage/edit' => 'public/customers#edit'
    patch 'customers/mypage' => 'public/customers#update', as: 'update_customer'
    get 'customers/mypage/withdraw' => 'public/customers#withdraw', as: 'withdraw_customer'
    patch 'customers/mypage' => 'public/customers#withdrawal', as: 'withdrawal_customer'

    get 'addresses' => 'public/addresses#index'
    post 'addresses' => 'public/addresses#create'
    get 'addresses/:id/edit' => 'public/addresses#edit', as: 'edit_address'
    patch 'addresses/:id' => 'public/addresses#update', as: 'update_address'
    delete 'addresses/:id' => 'public/addresses#destroy', as: 'destroy_address'

    get 'items' => 'public/items#index'
    get 'item/:id' => 'public/items#show', as: 'item'



    # resources :customers, only: [:show, :edit, :update]

  namespace :admin do
    root to: 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
