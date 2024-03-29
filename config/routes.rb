Rails.application.routes.draw do
  get '/search', to: 'searches#search'
  devise_for :users
  root to: "homes#top"

  get "home/about"=>"homes#about", as: "about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

    # ネストさせる
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
