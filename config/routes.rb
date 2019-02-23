Rails.application.routes.draw do
  apipie
  root 'apipie/apipies#index'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :customer, only: [:show]
      resources :video, only: [:show]
      resources :video_views, only: [:create]
    end
  end
end
