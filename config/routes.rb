Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
    resources :activities, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :members, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    end
    resources :users, only: [:show, :edit, :update]
 end
