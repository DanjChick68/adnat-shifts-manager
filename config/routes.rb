Rails.application.routes.draw do
  devise_for :users 
  resources :shifts
  resources :organisations
 # get 'home/index'
  get 'home/signup'
 root 'home#index'
 get 'home/joined'






end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
