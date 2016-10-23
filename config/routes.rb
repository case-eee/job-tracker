Rails.application.routes.draw do

  resources :companies do
    resources :jobs do
      resources :comments, only: [:create]
    end
  end

  resources :categories

  resources :contacts, only: [:create]

  resources :dashboard, only: [:index]

  resources :jobs, only: [:index]

  resources :tags

  root 'dashboard#index'

  get '/redirect' => 'dashboard#redirect'

  get '/errors' => 'dashboard#errors'
  
end
