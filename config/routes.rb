Bevalkyri::Application.routes.draw do
  
  root 'app#index'

  # match 'auth/:provider/callback', to: 'sessions#create', :via => :get
  # match 'auth/failure', to: redirect('/'), :via => :get
  # match 'signout', to: 'sessions#destroy', as: 'signout', :via => :get
  
  resource :session, only: [:new, :create, :destroy] 

  resources :users, except: [:index] do
    resources :players, only: [:index, :new, :create] do 
      resources :games, except: [:index]
    end
  end

  resources :boards, only: [:new, :create, :edit]
  resources :tiles, only: [:new, :create, :edit]
  resources :buildings, only: [:new, :create, :edit]
end
