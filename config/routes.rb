Rails.application.routes.draw do

  root'jobs#index'

  resources :companies do
    resources :jobs
    resources :contacts, only: [:create]
  end

  resources :jobs, only: [:show]
  resources :categories
  resources :comments, only: [:create]
  resources :dashboard, only: [:index]

  resources :jobs, path: '/jobs?location=', only: [:index]

end
