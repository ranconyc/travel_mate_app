Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'

  resources :activities do
    resources :members, only: [:create]
    resources :messages, only: :create
  end
  resources :members, only: :destroy
  resources :users, only: [:show, :edit, :update]

  resources :chats, only: %i[index show]
end
