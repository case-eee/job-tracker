Rails.application.routes.draw do

  resources :companies do
    resources :jobs
  end

  resources :categories
  resources :comments, only: [:create]
  resources :contacts, only: [:create]
  resources :dashboard, only: [:index]
end
