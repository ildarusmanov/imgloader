Rails.application.routes.draw do
  root to: 'home#index'
  
  namespace :api do
    namespace :v1 do
      resources :sourcelinks, only: [:index, :show, :create] do
        resources :images, only: [:index, :show]
      end
    end
  end
end
