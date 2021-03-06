Rails.application.routes.draw do
  get 'home/welcome'

  resources :industries, except: [:show]
  resources :interests, except: [:show]
  resources :locations, only: [:index, :show]
  resources :majors, except: [:show]
  
  resources :people, only: [:index, :show]

  root to: "home#welcome"
end
