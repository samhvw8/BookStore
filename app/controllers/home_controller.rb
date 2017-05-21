class HomeController < ApplicationController
    layout 'application'
    def index
        @categories = Category.all
        @book = Book.all
    end
end