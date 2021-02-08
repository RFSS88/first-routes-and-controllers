Rails.application.routes.draw do
  
  #Shortcut for generating routes
  #resources :users

  # Manual way of doing the same

  get 'users', to: 'users#index' 
  get 'users/:id', to: 'users#show', as: 'user' #the as: gives alias taht shows as prefix
  get 'users/new', to: 'users#new', as: 'new_user'
  get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  post 'users', to: 'users#create' 
  patch 'users/:id', to: 'users#update'
  put 'users/:id', to: 'users#update'
  delete 'users/:id', to:'users#destroy'

  
end
