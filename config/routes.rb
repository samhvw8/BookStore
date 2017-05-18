Rails.application.routes.draw do
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create', as: 'users'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/index', as: 'home'
  get 'book/manage'
end
