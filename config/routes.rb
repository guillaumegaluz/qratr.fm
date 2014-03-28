QratrRails::Application.routes.draw do

  root to: 'playlists#last'

  resources :playlists, :only => [ :show ]
  get '/new', to: 'playlists#new'
  get '/playlists/:playlist_id/tracks/:track_id', to: 'playlists#track'  

  get '/tracks/create.json', to: 'tracks#create'
  put '/tracks/:id', to: 'tracks#update'

  post '/subscriber', to: 'subscribers#create'

  resources :admin, :only => [ :index ] do
    put 'assign', on: :collection
  end

  post 'signup', to: 'users#create'
  resources :users, :only => [ :new, :create ]

  post 'login', to: 'sessions#create'
  resources :sessions, :only => [ :new, :create ]

  get 'logout', to: 'sessions#destroy'

  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
end
