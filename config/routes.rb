Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  namespace :admin do
    resources :accounts
    resources :conferences
    resources :papers
    resources :reviews
    resources :tracks
    resources :users
    resources :super_accounts

    root to: "accounts#index"
  end

  resources :tracks
  devise_for :accounts,  :controllers => { :registrations => 'registrations' }
  resources :users, only: [:edit, :update]
  resources :conferences do
    get "showid", on: :member
  end
  resources :reviews do
    get "showid", on: :member
  end
  resources :papers do
    put 'accept', on: :member
    post 'accept', on: :member
    get "showid", on: :member
  end
  root "papers#index"
  get "reviews/new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
