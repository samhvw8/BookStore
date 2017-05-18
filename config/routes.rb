Rails.application.routes.draw do
  get 'sessions/new'

  get '/signup', to: 'users#new', as: 'get_signup'
  post '/signup', to: 'users#create', as: 'post_signup'

  get    '/login',   to: 'sessions#new', as: 'get_login'
  post   '/login',   to: 'sessions#create', as: 'post_login'
  delete '/logout',  to: 'sessions#destroy', as: 'logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/index', as: 'home'
  get 'book/manage'
end
