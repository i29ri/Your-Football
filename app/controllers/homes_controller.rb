class HomesController < ApplicationController
  def top
    reviews = Review.all
    previews = Preview.all

    # それぞれの複数インスタンスを1つの配列にする
    @timelines = reviews | previews
    # 作成降順に並び替え
    @timelines.sort!{ |a, b| b.created_at <=> a.created_at }
    
  end

  def about
  end
end
