Rails.application.routes.draw do
  get 'images/index'

  get 'images/show'

  get 'sourcelinks/index'

  get 'sourcelinks/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  
  resources :sourcelinks, only: [:index, :show, :create], format: :json do
    resources :images, only: [:index, :show], format: :json
  end
end
