QratrRails::Application.routes.draw do

  resources :playlists, :only => [ :show ]

  resources :admin, :only => [ :index ]

end
