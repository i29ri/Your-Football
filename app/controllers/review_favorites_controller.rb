class ReviewFavoritesController < ApplicationController
  # ログインユーザーのみがいいねの操作が可能
  before_action :authenticate_user!
  # review.idの取得
  before_action :review_params


  def create
    @review = Review.find(params[:id])
    @match = Match.find(params[:id])
    ReviewFavorite.create(user_id: current_user.id, review_id: params[:id])
  end
  def destroy
    @review = Review.find(params[:id])
    @match = Match.find(params[:id])
    ReviewFavorite.find_by(user_id: current_user.id, review_id: params[:id]).destroy
  end

  private

  def review_params
    @review = Review.find(params[:id])
  end
end
