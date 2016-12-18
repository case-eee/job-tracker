Rails.application.routes.draw do
  root to: 'companies#index'
  resources :companies do
    resources :jobs do
      resources :comments
    end
  end

  resources :contacts 
  resources :categories
end
