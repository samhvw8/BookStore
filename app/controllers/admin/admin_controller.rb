class Admin::AdminController < ApplicationController
  before_action :check_login_admin

  private

  def check_login_admin
    unless logged_in?
      flash[:danger] = 'Please log in.'
      redirect_to get_login_url
      return
    end

    unless current_user.is_admin?
      flash[:danger] = 'Only admin can use'
      redirect_to root_url
    end

  end

end
