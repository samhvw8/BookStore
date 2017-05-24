Rails.application.routes.draw do

  get '/profile', to: 'sessions#show', as: 'profile'
  get '/signup', to: 'users#new', as: 'get_signup'
  post '/signup', to: 'users#create', as: 'post_signup'

  get    '/login',   to: 'sessions#new', as: 'get_login'
  post   '/login',   to: 'sessions#create', as: 'post_login'
  delete '/logout',  to: 'sessions#destroy', as: 'logout'

  resources :users, except: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'home#index', as: 'root'

  # Book management routes
  get '/book/manage', to: 'book#manage', as: 'book_management'
  post 'book/manage/create', to:'book#create', as: 'book_create'

end
