Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :posts, only: [:new, :create, :show, :index, :destroy]do
    resources :post_comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get 'home/index' => 'homes#index'
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
