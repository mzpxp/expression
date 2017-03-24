Rails.application.routes.draw do
  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  post "/" => "sessions#index"
  
  get 'money', to: 'microposts#money'
  
  resources :users
  resources :microposts

  post   'microposts/:micropost_id/likes' , to: 'likes#create'
  delete 'microposts/:micropost_id/likes' , to: 'likes#destroy'
end
