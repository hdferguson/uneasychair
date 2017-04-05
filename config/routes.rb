Rails.application.routes.draw do
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
  resources :conferences
  resources :reviews
  resources :papers, only: [:index, :new, :create, :destroy, :show]
  root "papers#index"
  get "reviews/new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
