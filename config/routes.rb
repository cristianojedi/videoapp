Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/show'
  devise_for :users
  root to: "home#index"
  get '/videos/list', to: 'videos#list', as: :list_videos
  resources :videos
  resources :users, only: %i[index show]
 end
