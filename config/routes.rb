Rails.application.routes.draw do

  root to: 'categories#index'
  resources :companies do
    resources :jobs do
      resources :comments
    end
  end
  resources :categories
  resources :dashboard, only: [:index]
end
