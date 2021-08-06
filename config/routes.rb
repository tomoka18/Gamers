Rails.application.routes.draw do
  resources :posts, only: [:new, :create, :show, :index, :destroy]
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get 'home/index' => 'homes#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
