class PpreviewsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def new
    @preview = Preview.new
  end

  def create
    @match = Match.find(params[:match_id])
    @preview = Preview.new(preview_params)
    @preview.match_id = @match.id
    @preview.user_id = current_user.id
    @preview.save
    redirect_to match_path(@match)
  end

  def show
    @match = Match.find(params[:match_id])
    @preview = Preview.find(params[:id])
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
