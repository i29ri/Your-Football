class ReviewCommentsController < ApplicationController
  def create
    @match = Match.find(params[:match_id])
    @review = Review.find(params[:review_id])
    @review_comment = current_user.review_comments.new(review_comment_params)
    @review_comment.review_id = @review.id
    @review_comment.save
    redirect_to match_review_path(@match, @review)
  end

  def destroy
    @match = Match.find(params[:match_id])
    @review = Review.find(params[:review_id])
    ReviewComment.find_by(id: params[:id], review_id: params[:review_id]).destroy
    redirect_to match_review_path(@match, @review)
  end

  private

  def review_comment_params
    params.require(:review_comment).permit(:comment)
  end

end
