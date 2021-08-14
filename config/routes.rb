Rails.application.routes.draw do
  resources :genres, only: [:index, :show]
  
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
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
  resources :genres, only: [:index, :show]
  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'
  get 'dm', to: 'users#chat', as: 'dm'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
