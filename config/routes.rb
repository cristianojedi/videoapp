Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  namespace :api do
    namespace :v1 do
      get '/videos/list', to: 'videos#list', as: :list_videos
      resources :videos
    end
  end
 end
