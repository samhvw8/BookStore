class ReviewsController < ApplicationController
  before_action :correct_user_or_admin, only: :destroy

  def create

    unless logged_in?
      flash[:danger] = 'Need Login !'
      redirect_to :back
      return
    end

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

    unless reading.nil?

      review = current_user.reviews.new(reading: reading,
                                        review: params[:review], vote: params[:vote])

      if review.save
        flash[:success] = 'Review added'
      else
        flash[:warning] = 'Review not added'
      end

    end


    redirect_to :back

  end

  def destroy
    review = Review.find(params[:id])

    unless review.nil?
      if review.destroy
        flash[:success] = 'review deleted'
      else
        flash[:warning] = 'Review not deleted'
      end
    else
      flash[:warning] = 'Review not found'
    end

    redirect_to :back
  end

  private

  def correct_user_or_admin
    review = Review.find(params[:id])

    unless current_user?(review.user) or current_user.is_admin?
      flash[:danger] = 'Not owner user | or admin'
      redirect_to :back
    end

  end

end
