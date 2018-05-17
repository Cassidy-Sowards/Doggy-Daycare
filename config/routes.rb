Rails.application.routes.draw do

  get 'sessions/new'
  get 'emp_sessons/new'

  get '/signup', to: 'users#new'

  
  post '/signup',  to: 'users#create'
  
  get 'users/home'
  
  get '/about', to: 'static_pages#about'
  
  get '/rates', to: 'static_pages#rates'
  
  get '/credits', to: 'static_pages#credits'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get '/emplogin', to: 'emp_sessions#new'
  post '/emplogin', to: 'emp_sessions#create'
  delete '/emplogout', to: 'emp_sessions#destroy'
  
  get 'empcreate', to: 'employees#new'
  post 'empcreate', to: 'employees#create'
  
 get '/newdog', to: 'dogs#new'
 post 'dogs/:id', to: 'dogs#destroy'

 get '/newres', to: 'reservations#new'

 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  
  resources :users
  resources :dogs
  resources :reservations
  resources :employees
end
