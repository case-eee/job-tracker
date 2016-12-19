Rails.application.routes.draw do
  root 'dashboard#index'

  resources :companies do
    resources :jobs do
      resources :comments, only: [:index, :new, :show, :create, :update]
    end
    resources :contacts, only: [:index, :new, :create, :edit, :update]
  end

  resources :categories

  get '/dashboard', to: 'dashboard#index'
  get '/jobs', to: 'jobs#sort'
end
