class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

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
    @match = Match.find(params[:match_id])
    @review = Review.find(params[:id])
    @review_comment = ReviewComment.new

    if @match.review.blank?
      @average_review = 0
    else
      @average_review = @match.review.average(:rating).round(2)
    end
  end

  def edit
    @review = Review.find(params[:id])
    @match = Match.find(params[:match_id])
  end

  def update
    @match = Match.find(params[:match_id])
    @review = @match.review.find(params[:id])
    @review.update(review_params)
    redirect_to match_path(@match), notice: 'レビューを更新しました'
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to match_path(@match), notice: 'レビューを削除しました'
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
