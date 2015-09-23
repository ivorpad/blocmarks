Rails.application.routes.draw do
  devise_for :users
  root to: "welcome#index"

  post :incoming, to: 'incoming#create'
end
