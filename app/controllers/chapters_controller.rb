class ChaptersController < ApplicationController
  def show
    @chapter = Chapter.find params[:id]

    @chapter.viewed = @chapter.viewed + 1

    @chapter.save


    if logged_in?
      sub = nil
      if @chapter.novel.nil?
        # comic
        sub = @chapter.comic.subscribes.where(user: current_user).first
      else
        # novel
        sub = @chapter.novel.subscribes.where(user: current_user).first
      end

      sub.update(current_chap: @chapter) unless sub.nil?

    end

  end
end
