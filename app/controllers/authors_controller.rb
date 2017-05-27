class AuthorsController < ApplicationController

  def new
    @author = Author.new
  end

  def create
    author_params = params.require(:author).permit(:name, :bio)
    @author = Author.new(author_params)

    if @author.save
      redirect_to book_new_path
    else
      render 'new'
    end


  end

  def show
    @author = Author.find(params[:id])

  end
end