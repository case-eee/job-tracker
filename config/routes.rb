Rails.application.routes.draw do
  root 'dashboard#index'


  resources :companies do
    resources :jobs
  end

  resources :categories 
  resources :comments, only: [:create]
  resources :contacts, only: [:create]
  resources :dashboard, only: [:index]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

end
