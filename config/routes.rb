Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :invitations, only: [:create]
  resources :events do
    resources :invitations, only: [:destroy]
    member do
      get 'unattend'
    end
  end
  root "events#index"
end
