Rails.application.routes.draw do
  resources :products, only: [:new, :create, :index]
  resources :products, only: [:show, :edit, :update, :destroy], path: "" do
    resources :purchase, only: [:show], controller: :purchase do
      post "stripe_session", to: "purchase#stripe_session", on: :collection
      get "success", to: "purchase#success", on: :collection
    end
  end   
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "products#index"
end
