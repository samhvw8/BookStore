class Admin::ChaptersController < ApplicationController
  def index
    if params.has_key?(:novel_id)
      @novel = Novel.find(params[:novel_id])
      @chapters = @novel.chapters
      render 'admin/chapters/novel_index'
    else
      if params.has_key?(:comic_id)

      end
    end
  end

  def new
    if params.has_key?(:novel_id)
      @novel = Novel.find(params[:novel_id])
      @chapter = Chapter.new
    end
  end

  def create
    if params.has_key?(:novel_id)
      @novel = Novel.find(params[:novel_id])
      chapter_params = params.require('chapter').permit(:no, :title)
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
    end
  end
end
