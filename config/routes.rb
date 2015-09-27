Rails.application.routes.draw do

  get 'bookmarks/show'

  get 'bookmarks/new'

  get 'bookmarks/edit'

  resources :topics

  devise_for :users
  root to: "welcome#index"

  post :incoming, to: 'incoming#create'
end
