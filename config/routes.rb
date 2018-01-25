Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :announcements, only: [:create, :destroy, :index, :edit, :update]
  resources :seen_announcements, only: [:edit, :update]
end
