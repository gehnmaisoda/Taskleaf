Rails.application.routes.draw do
  
  get '/login' => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  
  namespace :admin do
    resources :users
  end
  
  root "tasks#index"
  
  resources :tasks do
    post :import, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
