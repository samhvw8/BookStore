class SearchController < ApplicationController
  def index
    @novels = Novel.search(params[:keyword])

    @comics = Comic.search(params[:keyword])

    @authors = Author.search(params[:keyword])

    @categories = Category.search(params[:keyword])

    @chapters = Chapter.search(params[:keyword])

  end
end
