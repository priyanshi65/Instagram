# generate url and connect url and path with code

Rails.application.routes.draw do
    devise_for :users
    root "posts#index"
    get "posts/profile/:id", to: "posts#profile", as: :post_profile
    get "users/profile/:id", to: "users#profile", as: :user_profile
    get 'users', to: 'users#index'
    resources :posts do
       resources :likes, only: [:create, :destroy]
       resources :comments
    end
  
    resources :users, only: [:index,:create,:show, :edit, :update]
    resources :posts, only: [:new, :create,:update,:show,:destroy] 
    resources :users, path: '/', only: %i[show] do
      post :follow, to: 'follows#create', as: :follow
      delete :follow, to: 'follows#destroy', as: :unfollow
    end
end

















# post :follow, to: 'follows#create    '
# delete :follow, to: 'follows#destroy  '
# post :follow, to: 'follows#create', as: :follow
# delete :follow, to: 'follows#destroy', as: :unfollow
# resources :homes
# post 'follow', to: 'counts#increment', as: 'follow'
# post 'unfollow', to: 'counts#decrement', as: 'unfollow'
# root "posts"

# resources :likes, only: [:create, :destroy], shallow: true
# resources :comments, only: [:index, :create, :destroy], shallow: true
# end
# resources :posts do
#   member do
#     post 'like'
#     post 'comment'
#   end
# end
# resources :users, only: [:edit, :update]
# get '/profile', to: 'posts#profile', as: 'profile'

  # get '/messages', to: 'messages#index', as: 'messages'
  # get "/profile/:user_name" => "posts#profile",as: :profile
  # resources :posts, path: '/', param: :user_name, only: %i[show] do
  #   post :follow, to: 'posts/follows#create', as: :follow
  #   delete :follow, to: 'posts/follows#destroy', as: :unfollow
  
  # get 'search', to: 'posts#search', as: 'search_posts'
  
  
  # resources :posts do
  #   collection do
  #     get :search
  #   end
  # end





  # post "posts/p_form", to: "posts#p_form"
  # resources :users, only: [:show]

  # root to: "devise/sessions#new"

  # devise_for :models
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
