Rails.application.routes.draw do
  root 'companies#index'
  resources :companies do
    resources :contacts, only: [:create]
    resources :jobs, except: [:index] do
      resources :comments, only: [:create]
    end
  end

  resources :jobs, only: [:index]
  resources :categories
  resources :dashboards, only: [:index]
end
