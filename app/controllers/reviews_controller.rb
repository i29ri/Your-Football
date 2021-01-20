class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @match = Match.find(params[:match_id])
    @review = Review.new(review_params)
    @review.match_id = @match.id
    @review.user_id = current_user.id
    @review.save
    redirect_to match_path(@match)
  end

  def show
    @review = Review.find(params[:id])
    @match = Match.find(params[:id])
  end

  def edit
    @review = review.find(params[:id])
  end

  def update
    @review = review.find(params[:id])
  end

  def destroy
    @review = review.find(params[:id])
    @review.destroy
    redirect_to match_path(@match), notice: 'プレビューを削除しました'
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end
end

