class SubscribesController < ApplicationController
  before_action :logged_in_user

  def index
    @subscribes = current_user.subscribes
  end

  def create
    reading = nil
    if params.has_key?(:novel_id)
      reading = Novel.find params[:novel_id]
    else
      if params.has_key?(:comic_id)
        reading = Comic.find params[:comic_id]
      else
        redirect_to :back
      end
    end

    current_user.subscribes.create(reading: reading) unless reading.nil?
    flash[:success] = 'Subscribe added'
    redirect_to :back
  end

  def destroy

    sub = Subscribe.find(params[:id])

    unless sub.nil?
      sub.destroy
      flash[:success] = 'Subscribe deleted'
    end

    redirect_to subscribes_url
  end

  private

  def logged_in_user
    unless logged_in?
      flash[:danger] = 'Please log in.'
      redirect_to get_login_url
    end
  end


end
