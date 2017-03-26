Rails.application.routes.draw do
  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  post "/" => "sessions#index"
  
  get 'timeline' => "static_pages#timeline"
  get 'money', to: 'microposts#money'
  
  resources :users
  # resources :micropost
  post   'microposts/:micropost_id/likes' , to: 'likes#create'
  delete 'microposts/:micropost_id/likes' , to: 'likes#destroy'
  resources :microposts do
  
  get 'top10', :on => :collection
 end
end
