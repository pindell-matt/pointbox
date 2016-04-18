Rails.application.routes.draw do
  root to: 'sessions#new'

  resources :users, only: [:show, :new, :create, :edit, :update]
  resources :rewards, only: [:show, :index]

  namespace "admin" do
    resources :rewards
    resources :users do
      resources :points, only: [:new, :create, :destroy]
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
