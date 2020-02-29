Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#show'
  get '/home/about' => 'abouts#show'
  resources :users, only: %i[index show edit]
  resources :books
  resource :home, only: [:show]
end
