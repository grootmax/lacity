Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Set the root path to the public posts index page
  root 'posts#index'

  # Admin routes for managing posts
  namespace :admin do
    resources :posts
  end

  # Public routes for viewing posts and creating comments
  resources :posts, only: [:index, :show] do
    resources :comments, only: [:create]
  end

  # Defines the root path route ("/") - Already handled above
  # root "articles#index"
end
