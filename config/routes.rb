Rails.application.routes.draw do

  resources :companies do
    resources :jobs
  end

  resources :categories 
  resources :comments, only: [:create]
  resources :contacts, only: [:create]
  
  get '/dashboard', to: 'dashboard#index'
  get '/jobs', to: 'jobs#sort'
  resources :jobs, path: '/jobs?location=', only: [:index]



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

end
