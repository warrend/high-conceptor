Rails.application.routes.draw do

	root to: 'pages#index'

  get '/about' => 'pages#about'
  get '/' => 'pages#index'

	# Sessions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Omniauth
  get 'auth/github', as: :github_auth
  match 'auth/:provider/callback' => 'sessions#create', via: [:get, :post]

  resources :users
  # post 'users/new'
  resources :loglines 

  resources :users do
    resources :loglines
  end 

  
  resources :categories, only: [:show, :index]
  resources :ratings

# Create New User
  # get '/signup' => 'users#new'
  # post '/users' => 'users#create'
end
