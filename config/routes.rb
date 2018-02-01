Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users
  
  get '/seen', to: 'announcements#mark_as_seen'
  
  resources :users, only: [:show]
  resources :announcements, only: [:create, :destroy, :index, :edit, :update]
  
end
