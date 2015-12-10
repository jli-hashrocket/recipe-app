Rails.application.routes.draw do
  get 'recipes/index'

  root 'home#index'
  resources :recipes, only: [:index, :show, :create, :update, :destroy]
  resources :categories, only: [:index, :show, :create, :update, :destroy]
end
