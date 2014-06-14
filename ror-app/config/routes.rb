Rails.application.routes.draw do

  resources :dvds do
    resources :rentals
  end

  resources :rentals
  resources :languages
  resources :genres
  resources :users, :path => 'clients'

  root to: "index#index"

  get '*unmatched_route', :to => 'application#raise_not_found'
end
