Rails.application.routes.draw do
  resources :events
  resources :subjects
  resources :sis
  resources :priorities
  resources :categories
  resources :verifications
  resources :permanences
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'verifications#index'

  get '/calendrier', to: 'events#calendrier'

end
