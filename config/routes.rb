Bevalkyri::Application.routes.draw do
  
  root 'app#index'

  # match 'auth/:provider/callback', to: 'sessions#create', :via => :get
  # match 'auth/failure', to: redirect('/'), :via => :get
  # match 'signout', to: 'sessions#destroy', as: 'signout', :via => :get

  resource :session, only: [:new, :create, :destroy] 

  resources :users, except: [:index] do
    resources :players, only: [:new, :create, :destroy] do 
      resources :games, only: [:destroy] do
        collection do
          get 'start'
        end
        resources :boards, only: [:show] do
          collection do
            get 'build'
          end
        end
      end
    end
  end

  resources :tiles, only: [:index]
  resources :buildings, only: [:index]
  resources :stats, only: [:index]
end
