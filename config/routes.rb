Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"

  # Registration and Auth
  get "/register", to: "users#new"
  post "/register", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :events, only: [ :new, :create, :show, :index, :edit, :update ]
  resources :users, only: [ :show, :edit, :update ] do
    member do
      get :edit
      patch :update
    end
  end
  resources :competitions do
    resources :results, only: [ :new, :create, :edit, :update ]
    post "/participate", to: "competitions#participate"
    post "/judge", to: "competitions#judge"
    post "/set_results", to: "competitions#set_results"
    get "/edit", to: "competitions#edit", as: :edit
    patch "/edit", to: "competitions#update"
  end
end
