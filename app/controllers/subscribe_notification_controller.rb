class SubscribeNotificationController < ApplicationController
  def index

    @subscribes = current_user.subscribes.where(available: true)

    if @subscribes.blank?
      # don't have
      respond_to do |format|
        msg = {:have_notification => false}
        format.json {render :json => msg}
      end
    else
      # have
      respond_to do |format|
        msg = {:have_notification => true}
        format.json {render :json => msg}
      end
    end

  end
end
