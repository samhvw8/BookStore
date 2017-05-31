class SubscribesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: :destroy

  def index
    @subscribes = current_user.subscribes
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
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

end
