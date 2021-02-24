class PreviewsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def new
    @preview = Preview.new
  end

  def create
    @match = Match.find(params[:match_id])
    @preview = Preview.new(preview_params)
    @preview.match_id = @match.id
    @preview.user_id = current_user.id
    if @preview.save
      redirect_to match_path(@match)
    else
      render :new
    end
  end

  def show
    @match = Match.find(params[:match_id])
    @preview = Preview.find(params[:id])
    @preview_comment = PreviewComment.new
  end

  def edit
    @preview = Preview.find(params[:id])
    @match = Match.find(params[:match_id])
  end

  def update
    @match = Match.find(params[:match_id])
    @preview = @match.preview.find(params[:id])
    @preview.update(preview_params)
    redirect_to match_path(@match), notice: 'プレビューを更新しました'
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
