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

      unless sub.nil?

        if sub.current_chap.nil?
          sub.update(current_chap: @chapter)
        else
          if @chapter.id > sub.current_chap.id
            sub.update(current_chap: @chapter)
          end
        end


      end


    end

  end
end
