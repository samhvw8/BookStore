class ComicsController < ApplicationController
  def index
    if params.has_key?(:page)
      @comics = Comic.order('created_at DESC').page(params[:page]).per(20)
    else
      @comics = Comic.order('created_at DESC').page(1).per(20)
    end
  end

  def show
    @comic = Comic.find params[:id]
  end
end
