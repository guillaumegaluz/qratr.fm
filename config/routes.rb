QratrRails::Application.routes.draw do

  root to: 'playlists#last'

  resources :playlists, :only => [ :show ]

  get '/tracks/create.json', to: 'tracks#create'

  resources :admin, :only => [ :index ]
end
