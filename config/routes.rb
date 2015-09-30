Rails.application.routes.draw do

  resources :topics
  resources :bookmarks, except: [:index] do
    resources :likes, only: [:create, :destroy]
  end

  devise_for :users
  root to: "welcome#index"

  post :incoming, to: 'incoming#create'
end
