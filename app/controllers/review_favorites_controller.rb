class ReviewFavoritesController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    @review_favorite = current_user.review_favorite.new(review_id: review.id)
    @review_favorite.save
    redirect_to match_path(@match)
  end

  def destroy
    @review = Review.find(params[:review_id])
    @review_favorite = current_user.review_favorite.find_by(review_id: review.id)
    review_favorite.destroy
    redirect_to match_path(@match)
  end
end
