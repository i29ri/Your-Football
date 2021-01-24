class PpreviewCommentsController < ApplicationController
  def create
    @match = Match.find(params[:match_id])
    @preview = Preview.find(params[:preview_id])
    @preview_comment = current_user.preview_comments.new(preview_comment_params)
    @preview_comment.preview_id = @preview.id
    @preview_comment.save
    redirect_to match_preview_path(@match, @preview)
  end

  def destroy
    @match = Match.find(params[:match_id])
    @preview = Preview.find(params[:preview_id])
    PreviewComment.find_by(id: params[:id], preview_id: params[:preview_id]).destroy
    redirect_to match_preview_path(@match, @preview)
  end

  private

  def preview_comment_params
    params.require(:preview_comment).permit(:comment)
  end
end
