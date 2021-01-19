class PreviewFavoritesController < ApplicationController

  def create
    @preview = Preview.find(params[:preview_id])
    @preview_favorite = current_user.preview_favorite.new(preview_id: preview.id)
    @preview_favorite.save
    redirect_to match_path(@match)
  end

  def destroy
    @preview = Preview.find(params[:preview_id])
    @preview_favorite = current_user.preview_favorite.find_by(preview_id: preview.id)
    preview_favorite.destroy
    redirect_to match_path(@match)
  end
end
