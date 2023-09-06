Rails.application.routes.draw do
  get "/trips" => "trips#index"
  get "/trips/:id" => "trips#show"
  post "/trips" => "trips#create"
  patch "/trips/:id" => "trips#update"

  get "/places" => "places#index"
  post "/places" => "places#create"

  post "/users" => "users#create"

  post "/sessions" => "sessions#create"
end
