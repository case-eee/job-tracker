Rails.application.routes.draw do

  resources :companies do
    resources :jobs
  end

  resources :categories
  resources :comments, only: [:create, :destroy]
  resources :contacts, only: [:create, :destroy]
  resources :dashboard, only: [:index]

  root 'dashboard#home'

end
