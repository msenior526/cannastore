Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'static#home'
  get '/about', to: 'static#about'
  get '/contact', to: 'static#contact'
  
  get '/auth/:provider/callback', to: 'sessions#omniauth'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  get '/strains/most_reviewed', to: 'strains#most_reviewed'
  
  resources :strains do 
    resources :reviews
  end
  
  resources :categories, only: [:index, :show]

  resources :users, except: [:new, :create, :index] do
    resources :favorites, only: [:index, :create]
  end
end
