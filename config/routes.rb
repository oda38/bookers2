Rails.application.routes.draw do
  
  devise_for :users
  root to: "homes#top"
  
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
  
  
 ## get 'books/index' => 'books#index', as: "books"
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
