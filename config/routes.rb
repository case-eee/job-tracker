Rails.application.routes.draw do

  resources :companies do
    resources :contacts
    resources :jobs do
      resources :comments, only: [:create]
    end
  end
  resources :categories
  resources :dashboard, only: [:index]
  get 'jobs' => 'jobs#root'
  root to: 'dashboard#index'
end
