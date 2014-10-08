Rails.application.routes.draw do

  mount S3Relay::Engine => "/s3_relay"

  resources :things, only: [:index, :show]

  root "things#index"

end
