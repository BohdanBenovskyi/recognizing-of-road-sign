Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'

  resources :articles, only: [:new, :show, :create, :edit, :update, :destroy]
end
