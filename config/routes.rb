Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:new, :create, :show, :index, :destroy]do
    resources :post_comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get 'home/index' => 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
