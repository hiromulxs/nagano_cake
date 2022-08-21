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
    patch 'customers/mypage' => 'public/customer#update'
    
    # resources :customers, only: [:show, :edit, :update]
    
    # namespace :public do
    #   get 'customers/show'
    #   get 'customers/edit'
    # end
  
  namespace :admin do
    root to: 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
