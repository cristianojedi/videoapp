Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get '/videos/list', to: 'videos#list', as: :list_videos
  get '/videos/view/:id', to: 'videos#view', as: :view_video
  resources :videos
  resources :users, only: %i[index show]
 end
