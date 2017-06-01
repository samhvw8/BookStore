class Admin::ChaptersController < ApplicationController
  def index
    if params.has_key?(:novel_id)
      @novel = Novel.find(params[:novel_id])
      @chapters = @novel.chapters
      render 'admin/chapters/novel_index'
    else
      if params.has_key?(:comic_id)
        @comic = Comic.find(params[:comic_id])
        @chapters = @comic.chapters
        render 'admin/chapters/comic_index'
      end
    end
  end

  def new
    @chapter = Chapter.new
    if params.has_key?(:novel_id)
      @novel = Novel.find(params[:novel_id])
    else
      if params.has_key?(:comic_id)
        @comic = Comic.find(params[:comic_id])
        render 'admin/chapters/comic_new'
      end
    end
  end

  def create
    chapter_params = params.require('chapter').permit(:no, :title)
    if params.has_key?(:novel_id)
      @novel = Novel.find(params[:novel_id])
      @chapter = @novel.chapters.new(chapter_params)
      txt_params = params.require('content').permit(:txt_content)
      @text_content = TextContent.new(txt_params)
      if @text_content.valid? && @chapter.valid?
        @text_content.save
        @chapter.save
        @chapter.texts << @text_content
        redirect_to admin_novel_chapters_path(@novel)
      else
        render 'admin/chapters/new'
      end
    else
      if params.has_key?(:comic_id)
        @comic = Comic.find(params[:comic_id])
        @chapter = @comic.chapters.new(chapter_params)
        if @chapter.save
          if params[:chapter][:content]
            params[:chapter][:content].each { |image|
              @chapter.images.create(image: image)
            }
          end
        else
          render 'admin/chapters/comic_new'
        end
      end
    end
  end
end
