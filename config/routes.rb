# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :rooms
    resources :reservations
    resources :reviews
  end

  resources :rooms do
    resources :reservations
  end

  resources :reviews, except: %i[edit]
  get '/admin', to: 'admin/homepage#index'
  root 'homepage#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
