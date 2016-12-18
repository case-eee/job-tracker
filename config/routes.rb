Rails.application.routes.draw do

  root to: 'categories#index'
  resources :companies do
    resources :contacts
    resources :jobs do
      resources :comments, only: [:create]
    end
  end
  resources :categories
  resources :dashboard, only: [:index]
end
