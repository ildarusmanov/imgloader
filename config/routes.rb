Rails.application.routes.draw do
  root to: 'home#index'
  
  resources :sourcelinks, only: [:index, :show, :create] do
    resources :images, only: [:index, :show]
  end
end
