Rails.application.routes.draw do

  get 'get_sub', to: 'subscribe_notification#index', as: 'get_notification'

  resources :novels, only: [:index, :show] do
    resources :subscribes, only: [:create]
    resources :reviews, only: [:create]
  end

  resources :comics, only: [:index, :show] do
    resources :subscribes, only: [:create]
    resources :reviews, only: [:create]
  end

  resources :reviews, only: [:destroy]

  resources :subscribes, only: [:index, :destroy]

  resources :chapters, only: [:show]

  resources :categories, only: [:show, :index]

  resources :authors, only: [:show]

  get 'profile', to: 'sessions#show', as: 'profile'
  get 'signup', to: 'users#new', as: 'get_signup'
  post 'signup', to: 'users#create', as: 'post_signup'

  get 'login', to: 'sessions#new', as: 'get_login'
  post 'login', to: 'sessions#create', as: 'post_login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users, except: [:index, :show]

  get '/', to: 'home#index', as: 'root'



  namespace :admin do
    resources :authors
    resources :categories

    resources :novels, only: [:new, :create, :show, :index] do
      resources :chapters, only: [:new, :create, :index]
    end

    resources :comics, only: [:new, :create, :show] do
      resources :chapters, only: [:new, :create, :index]
    end

  end

end
