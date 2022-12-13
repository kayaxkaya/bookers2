Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  resources :users,only: [:index,:show,:edit]
  resources :books,only: [:index,:create,:show,:edit]
  get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end