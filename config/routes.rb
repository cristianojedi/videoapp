Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get '/videos/list', to: 'videos#list', as: :list_videos
  resources :videos
 end
