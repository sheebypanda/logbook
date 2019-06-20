Rails.application.routes.draw do
  resources :events
  resources :subjects
  resources :sis
  resources :priorities
  resources :categories
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'events#dashboard'

  get '/calendrier', to: 'events#calendrier'
  get '/dashboard', to: 'events#dashboard'

end
