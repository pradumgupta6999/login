Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :signups
  resources :logins
  post "/login/create",to:"logins#create"
  get "/destroy" => "logins#destroy"
end
