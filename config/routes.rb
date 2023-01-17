Rails.application.routes.draw do
  resources :users
  get "/login", to: 'login#new'
  post "/login", to: 'login#create'
  get "/logout", to: 'login#destroy'
  resources :devices
  resources :ssms
  root :to => 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
