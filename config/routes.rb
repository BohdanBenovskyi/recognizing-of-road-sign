Rails.application.routes.draw do
  get 'resumes/index'
  get 'resumes/new'
  get 'resumes/create'
  get 'resumes/destroy'
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'

  resources :articles, only: [:new, :show, :create, :edit, :update, :destroy]
  resources :resumes, only: [:index, :new, :create, :destroy]
end
