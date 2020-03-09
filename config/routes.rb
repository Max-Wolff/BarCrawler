Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bars, only: [:update]
  resources :drinks, only: [:index]
  resources :members, only: [:index, :new, :create]
  resources :groups, only: [:new, :create, :edit, :update]

  get 'group/shared/:token', to: 'groups#shared', as: 'unique_group'
  get 'group/shared/:token/:rank', to: 'stops#show', as: 'unique_group_stop'
  get 'group/shared/:token/:rank/wheel', to: 'stops#wheel', as: 'unique_group_stop_wheel'
  get 'group/shared/:token/:rank/game', to: 'stops#game', as: 'unique_group_stop_game'
  get 'group/shared/:token/:rank/select', to: 'stops#select', as: 'unique_group_stop_select'
  get 'group/:id', to: 'groups#show', as: 'show_group'
  post 'bars', to: 'bars#index', as: 'bars'
end
