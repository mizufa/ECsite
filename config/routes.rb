Rails.application.routes.draw do

  namespace :admin do
    get 'homes/top'
  end
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


  #get "//:id/edit" => ""

  scope module: :public do #権限付き、urlに権限名がつかない。
    root to: "homes#top"
    get "/about" => "homes#about"
    get "/customers/unsubscribe" => "customers#unsubscribe" #退会確認画面へのルーティング
    patch "/customers/withdraw" => "customers#withdraw" #退会処理へのルーティング
    resources :customers, only: [:show, :edit, :update]
    resources :items, only: [:show, :index, :create]
    resources :items, only: [:show, :index, :create]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]
    get "/orders/completion" => "orders#completion"
    resources :orders, only: [:show, :index, :new]
    post "/orders/confirm" => "orders#confirm"
    post "/orders" => "orders#create"
  end

  namespace :admin do #権限付き、urlに権限名がつく。
    root to: "homes#top"
    resources :customers
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:show, :index]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
