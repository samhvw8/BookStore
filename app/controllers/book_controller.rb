class BookController < ApplicationController
	layout 'application'
    def manage
        @authors = Author.all
        @category = Category.all
    end

    def create
    	
    end
end
