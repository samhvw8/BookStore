class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    category_params = params.require(:category).permit(:title)
    @category = Category.new(category_params)

    if @category.save
      redirect_to book_new_path
    else
      render 'new'
    end
  end
end
