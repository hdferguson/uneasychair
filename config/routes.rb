Rails.application.routes.draw do
  namespace :admin do
    resources :accounts
    resources :authors
    resources :chairs
    resources :conferences
    resources :papers
    resources :pcchairs
    resources :pcmembers
    resources :reviews
    resources :tracks
    resources :super_accounts

    root to: "accounts#index"
  end

  resources :tracks
  devise_for :accounts,  :controllers => { :registrations => 'registrations' }
  resources :authors, only: [:edit, :update]
  resources :chairs, only: [:edit, :update]
  resources :pcchairs, only: [:edit, :update]
  resources :pcmembers, only: [:edit, :update]
  resources :conferences
  resources :reviews
  resources :papers, only: [:index, :new, :create, :destroy, :show]
  root "papers#index"
  get "reviews/new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
