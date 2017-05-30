class HomeController < ApplicationController
  def index
    @categories = Category.all
    @novels = Novel.order('id DESC').page(1).per(15)
    @comics = Comic.order('id DESC').page(1).per(15)
  end
end