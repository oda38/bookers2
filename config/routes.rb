Rails.application.routes.draw do
  
  devise_for :users
  root to: "homes#top"
  get 'home/about' => 'homes#about', as: "about"

  
  
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
  
  resources :users, only: [:create, :index, :show, :edit, :update]
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
