Rails.application.routes.draw do
  namespace :api do
    get "/markers" => 'markers#index'
    post "/markers" => 'markers#create'
    get "/markers/:id" => 'markers#show'
    patch "/markers/:id" => 'markers#update'
    delete "/markers/:id" => 'markers#destroy'

    post "/users" => 'users#create'

    post "/sessions" => 'sessions#create'
  end
end
