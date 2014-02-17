QratrRails::Application.routes.draw do

  root to: 'playlists#last'

  resources :playlists, :only => [ :show ]
  get '/new', to: 'playlists#new'  

  get '/tracks/create.json', to: 'tracks#create'
  put '/tracks/:id', to: 'tracks#update'

  post '/subscriber', to: 'subscribers#create'

  resources :admin, :only => [ :index ] do
    put 'assign', on: :collection
  end

  get 'sign_up', to: 'users#new'
  resources :users, :only => [ :new, :create ]

  get 'login', to: 'sessions#new'
  resources :sessions, :only => [ :new, :create ]

  get 'logout', to: 'sessions#destroy'
end
