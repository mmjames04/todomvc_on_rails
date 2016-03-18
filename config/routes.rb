Todos::Application.routes.draw do
  get "tweets/new"
  get "tweets/create"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "auth/twitter/callback" => "sessions#create"
  get "auth/failure", to: redirect('/')
  get "signout" => "sessions#destroy", :as => :signout

  resources :users

  resources :sessions, only: [:create, :destroy]

  resources :todos do
    member do
      post :toggle
    end

    collection do
      post :toggle_all
      get :active
      get :completed
      delete :destroy_completed
    end
  end

  root to: "todos#index"
end
