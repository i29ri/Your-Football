class PpreviewFavoritesController < ApplicationController
  # ログインユーザーのみがいいねの操作が可能
  before_action :authenticate_user!
  # preview.idの取得
  before_action :preview_params


  def create
    @preview = Preview.find(params[:id])
    @match = Match.find(params[:id])
    PreviewFavorite.create(user_id: current_user.id, preview_id: params[:id])
  end
  def destroy
    @preview = Preview.find(params[:id])
    @match = Match.find(params[:id])
    PreviewFavorite.find_by(user_id: current_user.id, preview_id: params[:id]).destroy
  end

  private

  def preview_params
    @preview = Preview.find(params[:id])
  end

end