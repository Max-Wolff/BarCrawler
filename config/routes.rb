Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bars, only: [:index, :update]
  resources :drinks, only: [:index]
  resources :members, only: [:index, :new, :create]
  resources :groups, only: [:new, :create] do
    resources :stops, only: [:index, :show, :new, :create]
  end
  get 'group/:token', to: 'group#show', as: 'unique_group'
end
