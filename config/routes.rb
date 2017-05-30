Rails.application.routes.draw do

  resources :novels, only: [:index, :show ]

  resources :comics, only: [:index, :show ]

  get 'profile', to: 'sessions#show', as: 'profile'
  get 'signup', to: 'users#new', as: 'get_signup'
  post 'signup', to: 'users#create', as: 'post_signup'

  get 'login', to: 'sessions#new', as: 'get_login'
  post 'login', to: 'sessions#create', as: 'post_login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users, except: [:index, :show]


  get '/', to: 'home#index', as: 'root'


  resources :chapters, only: [:show]

  resources :categories, only: [:show, :index]

  resources :authors, only: [:show, :new, :create]

  namespace :admin do
    resources :novels
  end

end
