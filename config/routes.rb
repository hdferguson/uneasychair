Rails.application.routes.draw do
  resources :committees
  get 'hello_world', to: 'hello_world#index'
  namespace :admin do
    resources :accounts
    resources :conferences
    resources :papers
    resources :reviews
    resources :tracks
    resources :committees
    resources :users
    resources :super_accounts

    root to: "accounts#index"
  end

  resources :tracks
  resources :committees do
    resources :papers, only: [:new, :create]
  end
  devise_for :accounts,  :controllers => { :registrations => 'registrations' }
  resources :users, only: [:edit, :update]
  resources :conferences do
    get "showid", on: :member
    resources :tracks, only: [:new, :create]
    resources :committees, only: [:new, :create]
  end
  resources :reviews do
    get "showid", on: :member
  end
  resources :papers do
    put 'accept', on: :member
    post 'accept', on: :member
    put 'decline', on: :member
    post 'decline', on: :member
    put 'rate', on: :member
    post 'rate', on: :member
    get "showid", on: :member
    resources :reviews, only: [:new, :create]
  end
  root "conferences#index"
  get "reviews/new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
