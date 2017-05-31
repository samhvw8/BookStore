class Admin::NovelsController < ApplicationController
  def new
    @novel = Novel.new
    @category = Category.new
    @author = Author.new
  end

  def create
  end

  def update
  end

  def edit
  end

  def delete
  end
end
