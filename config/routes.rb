Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  jsonapi_resources :teams, only: %i[create] do
    jsonapi_resources :players, only: %i[create]
  end
end
