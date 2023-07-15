Rails.application.routes.draw do

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
  end

  namespace :admin do #権限付き、urlに権限名がつく。
    resources :customers
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
