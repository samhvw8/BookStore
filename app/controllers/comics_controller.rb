class ComicsController < ApplicationController
  def index
    if params.has_key?(:page)
      @comics = Comic.order('id DESC').page(params[:page]).per(20)
    else
      @comics = Comic.order('id DESC').page(1).per(20)
    end
  end

  def show
    @comic = Comic.find params[:id]
  end
end
