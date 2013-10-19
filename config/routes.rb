QratrRails::Application.routes.draw do

  resources :playlists, :only => [ :show ]

end
