class HomeController < ApplicationController
  def index
    @categories = Category.all
    @novels = Novel.order('created_at DESC').page(1).per(10)
    @comics = Comic.order('created_at DESC').page(1).per(10)
  end
end