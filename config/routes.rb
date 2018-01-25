Rails.application.routes.draw do
  root to: 'home#index'
  
  resources :sourcelinks, only: [:index, :show, :create], format: :json do
    resources :images, only: [:index, :show], format: :json
  end
end
