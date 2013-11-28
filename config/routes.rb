QratrRails::Application.routes.draw do

  resources :playlists, :only => [ :show ]

  get '/tracks/create.json', to: 'tracks#create'

  resources :admin, :only => [ :index ]
end
