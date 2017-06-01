class Admin::ComicsController < ApplicationController
  def index
    @comics = Comic.order('id DESC').page(params[:page]).per(30)
  end

  def new
    @comic = Comic.new
    @category = Category.new
    @author = Author.new
    @categories = Category.all
    @authors = Author.all
  end
  
  def create
    comic_params = params.require('comic').permit(:title, :description)
    @comic = Comic.new(comic_params)

    if @comic.save
      # add category and author
      params[:authors].each do |au_id|
        if Author.exists?(au_id)
          author = Author.find(au_id)
          @comic.add_author(author)
        end
      end

      params[:categories].each do |cat_id|
        if Category.exists?(cat_id)
          cat = Category.find(cat_id)
          @comic.add_category(cat)
        end
      end

      redirect_to admin_comics_path
    else
      @category = Category.new
      @author = Author.new
      @categories = Category.all
      @authors = Author.all
      render 'admin/comics/new'
    end
  end
end
