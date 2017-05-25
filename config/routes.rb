Rails.application.routes.draw do

  get 'order_book/:id/:qty', to: 'order_books#update', as: 'order_books'
  delete 'order_book/:id', to: 'order_books#destroy', as: 'delete_order_books'

  get 'carts', to: 'carts#show', as: 'carts'

  delete 'carts/destroy', to: 'carts#destroy', as: 'delete_carts'

  put 'books/:id/order', to: 'carts#update', as: 'add_to_cart'
  put 'books/:id/order/:order_book', to: 'order_books#update', as: 'update_orderbook'
  delete 'books/:id/order/:order_book', to: 'order_books#delete', as: 'delete_orderbook'

  get 'profile', to: 'sessions#show', as: 'profile'
  get 'signup', to: 'users#new', as: 'get_signup'
  post 'signup', to: 'users#create', as: 'post_signup'

  get 'login', to: 'sessions#new', as: 'get_login'
  post 'login', to: 'sessions#create', as: 'post_login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users, except: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'home#index', as: 'root'

  get 'books/:id', to: 'books#show', as: 'books'

  # Book management routes

  get '/books/new', to: 'books#new', as: 'book_new'
  post '/books', to: 'books#create', as: 'book_create'
  get 'manage/books/', to: 'books#manage', as: 'books_management'


  resources :categories

  resources :authors

end
