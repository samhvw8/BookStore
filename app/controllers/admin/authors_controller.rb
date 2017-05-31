class Admin::AuthorsController < Admin::AdminController
  def new
  end

  def create
    author_params = params.require('author').permit(:name, :bio)
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.json {render json: @author}
      else
        format.json { render json: @author.errors }
      end
    end
  end
end
