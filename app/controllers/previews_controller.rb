class PreviewsController < ApplicationController

  def new
    @preview = Preview.new
    @match = Match.find(params[:id])
  end

  def create
    @preview = Preview.new(preview_params)
    @preview.match_id = Match.find(params[match.id])
    @preview.user_id = current_user.id
    @preview.save
    redirect_to match_path(@match)
  end

  def show
    @preview = Preview.find(params[:id])
    @match = Match.find(params[:id])
  end

  def edit
    @preview = Preview.find(params[:id])
  end

  def update
    @preview = Preview.find(params[:id])
  end

  def destroy
    @preview = Preview.find(params[:id])
    @preview.destroy
    redirect_to match_path(@match), notice: 'プレビューを削除しました'
  end

  private

  def preview_params
    params.require(:preview).permit(:comment)
  end
end
