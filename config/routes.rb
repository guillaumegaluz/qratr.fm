QratrRails::Application.routes.draw do

  root to: 'playlists#last'

  resources :playlists, :only => [ :show ]

  get '/tracks/create.json', to: 'tracks#create'
  put '/tracks/:id', to: 'tracks#update'

  resources :admin, :only => [ :index ] do
    put 'assign', on: :collection
  end
end
