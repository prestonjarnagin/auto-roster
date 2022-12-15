Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: :sessions },
                     path_names: { sign_in: :login }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace 'teams' do
    get 'find/:slug', to: 'find#show'
  end

  resources :teams, only: %i[create show] do
    resources :players, only: %i[create index]
  end

  resources :player_position_preferences, only: %i[create],
                                          path: 'player-position-preferences'
end
