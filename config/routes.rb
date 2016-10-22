Rails.application.routes.draw do

  resources :companies do
    resources :jobs do
      resources :comments
    end
    resources :contacts
  end

  resources :categories
end
