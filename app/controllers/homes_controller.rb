class HomesController < ApplicationController
  def top
    if user_signed_in?
      @user = User.find(current_user.id)
      # フォローしているユーザーを取得
      @follow_users = @user.followings

      # フォローしているユーザーのレビュー・プレビューを取得
      reviews = Review.all.where(user_id: @follow_users)
      previews = Preview.all.where(user_id: @follow_users)
      # それぞれの複数インスタンスを1つの配列にする
      @timelines = reviews | previews
      # 作成降順に並び替え
      @timelines.sort! { |a, b| b.created_at <=> a.created_at }
    else
    end
  end

  def about
  end
end
