class HomesController < ApplicationController
  def top
    @user = User.find(current_user.id)
    #フォローしているユーザーを取得
    @users = @user.followings

    reviews = Review.all
    previews = Preview.all
    # それぞれの複数インスタンスを1つの配列にする
    @timelines = reviews | previews
    # 作成降順に並び替え
    @timelines.sort!{ |a, b| b.created_at <=> a.created_at }

    #フォローユーザーのツイートを表示
    # @timelines = @timelines.where(user_id: @follow_users).order("created_at DESC")
  end

  def about
  end
end
