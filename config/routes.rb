Rails.application.routes.draw do

  resources :companies do
    resources :jobs do
      resources :comments, only: [:index, :new, :show, :create, :update]
    end
  end

  resources :categories
end
