class Admin::NovelsController < ApplicationController
  def new
    @novel = Novel.new
    @category = Category.new
    @author = Author.new
    @categories = Category.all
    @authors = Author.all
  end

  def create
    novel_params = params.require('novel').permit(:title, :description)
    @novel = Novel.new(novel_params)

    if @novel.save
      # add category and author
      params[:authors].each do |au_id|
        if Author.exists?(au_id)
          author = Author.find(au_id)
          @novel.add_author(author)
        end
      end

      params[:categories].each do |cat_id|
        if Category.exists?(cat_id)
          cat = Category.find(cat_id)
          @novel.add_category(cat)
        end
      end
    else
      @category = Category.new
      @author = Author.new
      @categories = Category.all
      @authors = Author.all
      render 'admin/novels/new'
    end
  end

  def update
  end

  def edit
  end

  def delete
  end
end
