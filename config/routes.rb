Rails.application.routes.draw do
  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'money', to: 'microposts#money'
  
  resources :users
  resources :microposts
  resources :microposts do
    resources :likes, only: [:create, :destroy]
  end
end
