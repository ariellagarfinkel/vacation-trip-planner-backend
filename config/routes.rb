Rails.application.routes.draw do
  get "/trips" => "trips#index"
  get "/trips/:id" => "trips#show"
  post "/trips" => "trips#create"
  patch "/trips/:id" => "trips#update"

  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
end
