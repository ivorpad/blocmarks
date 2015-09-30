Rails.application.routes.draw do

  get 'users/show'

  resources :topics
  resources :bookmarks, except: :index

  devise_for :users
  root to: "welcome#index"

  post :incoming, to: 'incoming#create'
end
