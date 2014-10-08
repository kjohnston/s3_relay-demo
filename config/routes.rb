Rails.application.routes.draw do

  resources :things, only: [:index, :show]

  root "things#index"

end
