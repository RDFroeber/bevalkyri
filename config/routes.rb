Bevalkyri::Application.routes.draw do
  
  root 'app#index'

  # match 'auth/:provider/callback', to: 'sessions#create', :via => :get
  # match 'auth/failure', to: redirect('/'), :via => :get
  # match 'signout', to: 'sessions#destroy', as: 'signout', :via => :get

  resource :session, only: [:new, :create, :destroy] 

  resources :users, except: [:index] do
    resources :players, only: [:new, :create, :destroy] do 
      resources :games, only: [:destroy] do
        resources :boards, only: [:create, :show]
        collection do
          get 'start'
        end
      end
    end
  end

  resources :tiles, only: [:create, :update]
  resources :buildings, only: [:create, :update]
end
