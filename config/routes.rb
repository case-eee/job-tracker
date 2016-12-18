Rails.application.routes.draw do

  resources :companies do
    resources :jobs do
      resources :comments, only: [:index, :new, :show, :create, :update]
    end
    resources :contacts, only: [:index, :new, :show, :create, :edit, :update]
  end

  resources :categories
end
