# frozen_string_literal: true

Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get '/gradebook', to: 'static_pages#gradebook'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'gradereport', to: 'presentations#student'
  get 'student_evaluation', to: 'evaluations#student'

  get	'password_reset',	to:	'password_resets#edit'
  patch	'password_reset',	to:	'password_resets#update'
  resources :users
  resources :presentations, only: %i[index new show create destroy edit update student]
  resources :evaluations, only: %i[index edit update destroy]
  resources :announcements, only: %i[index new show create destroy edit update]
  resources :password_resets, only: %i[edit update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
