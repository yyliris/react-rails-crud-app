# frozen_string_literal: true

Rails.application.routes.draw do
  root to: redirect('/events')

  get 'events', to: 'site#index'
  get 'events/new', to: 'site#index'
  get 'events/:id', to: 'site#index'
  get 'events/:id/edit', to: 'site#index'
  get 'events/:id/edit', to: 'site#index'



  namespace :api do
    resources :events, only: %i[index show create destroy update]
  end

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  namespace :userapi do
    resources :users, only: %i[index show signin signup]
  end
end
