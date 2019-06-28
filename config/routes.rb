# frozen_string_literal: true

Rails.application.routes.draw do
  root to: redirect('/events')
  
  get 'events', to: 'site#index'
  get 'events/new', to: 'site#index'
  get 'events/:id', to: 'site#index'
  get 'events/:id/edit', to: 'site#index'
  get 'events/:id/edit', to: 'site#index'
  get    'login',   to: 'site#index'
  post   'login',   to: 'site#index'
  # delete 'logout',  to: 'site#index'
  
  namespace :api do
    resources :events, only: %i[index show create destroy update]
    resources :users, only: %i[index show create destroy update]
    resources :sessions, only: %i[index create destroy]
  end
  # resources :events, only: %i[index show create destroy update]
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
end
