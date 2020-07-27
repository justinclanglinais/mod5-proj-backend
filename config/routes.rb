Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/users', to: 'users#index'
      get '/users/:id', to: 'users#show'
      get '/current_user', to: 'auth#show'
      get '/instructors', to: 'users#instructors'
    end
  end
  resources :sessions, only: [:create, :index, :show, :update, :edit]
  resources :enrollments, only: [:create, :index]
  get '/topics', to: 'topics#index'
  get '/categories', to: 'categories#index'
end
