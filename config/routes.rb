Rails.application.routes.draw do
	
	root to: 'loglines#index'

  get '/about' => 'pages#about'
  get '/' => 'pages#index'

	# Sessions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Omniauth
  get 'auth/github', as: :github_auth
  match 'auth/:provider/callback' => 'sessions#create', via: [:get, :post]

  # Create New User
	get '/signup' => 'users#new'
  post '/users' => 'users#create'

  resources :users do
    resources :loglines
  end 

  resources :users
  resources :loglines 

end
