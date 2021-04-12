Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'welcome#home'
  get '/auth/:provider/callback', to: 'sessions#omniauth'

  resources :strains do 
    resources :reviews
  end
  get '/most_reviewed', to: 'strains#most_reviewed'

  resources :categories, only: [:index, :show]

  resources :users, except: [:new, :create, :index] do
    resources :favorites, only: [:index, :create]
  end

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
end
