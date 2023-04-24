Rails.application.routes.draw do
 root 'users#new'
 
 get '/login',  to: 'sessions#new', as: 'new_session'
 post '/login', to: 'sessions#create'
 delete '/logout', to: 'sessions#destroy'

 resources :users, only: [:new, :create, :show]
 
 resources :albums do
    resources :images
 end
 get '/signup', to: 'users#new'
end
