class Admin::CategoriesController < ApplicationController
  def create
    category_params = params.require('category').permit(:title)
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.json {render json: @category}
      else
        format.json { render json: @category.errors }
      end
    end
  end
end
