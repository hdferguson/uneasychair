Rails.application.routes.draw do
  resources :reviews
 resources :papers, only: [:index, :new, :create, :destroy]
  root "papers#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
