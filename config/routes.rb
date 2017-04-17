Rails.application.routes.draw do
	
	root to: 'pages#index'

  get '/about' => 'pages#about'
  get '/' => 'pages#index'

	# Sessions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Create New User
	get '/signup' => 'users#new'
  post '/users' => 'users#create'

end
