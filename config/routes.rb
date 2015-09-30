Rails.application.routes.draw do

  get 'users/show'

  resources :topics
  resources :bookmarks, except: [:index] do
    resources :likes, only: [:create, :destroy]
  end

  devise_for :users
  resources :users, only: [:show]

  root to: "welcome#index"

  post :incoming, to: 'incoming#create'
end
