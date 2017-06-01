class Admin::NovelsController < Admin::AdminController
  def new
    @novel = Novel.new
    @category = Category.new
    @author = Author.new
    @categories = Category.all
    @authors = Author.all
  end

  def create
    novel_params = params.require('novel').permit(:title, :description, :cover)
    @novel = Novel.new(novel_params)

    if @novel.save
      # add category and author
      if params[:authors]
        params[:authors].each do |au_id|
          if Author.exists?(au_id)
            author = Author.find(au_id)
            @novel.add_author(author)
          end
        end
      end

      if params[:categories]
        params[:categories].each do |cat_id|
          if Category.exists?(cat_id)
            cat = Category.find(cat_id)
            @novel.add_category(cat)
          end
        end
      end
      redirect_to admin_novels_path
    else
      @category = Category.new
      @author = Author.new
      @categories = Category.all
      @authors = Author.all
      render 'admin/novels/new'
    end
  end

  def index
    @novels = Novel.order('id DESC').page(params[:page]).per(30)
  end

end
