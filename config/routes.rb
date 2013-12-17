Bevalkyri::Application.routes.draw do
  
  root 'app#index'

  # match 'auth/:provider/callback', to: 'sessions#create', :via => :get
  # match 'auth/failure', to: redirect('/'), :via => :get
  # match 'signout', to: 'sessions#destroy', as: 'signout', :via => :get

  resources :users, except: [:index]
  resources :players, only: [:new, :create, :show, :destroy]
end
