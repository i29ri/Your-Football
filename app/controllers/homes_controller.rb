class HomesController < ApplicationController
  def top
<<<<<<< HEAD
    reviews = Review.all
    previews = Preview.all

    # それぞれの複数インスタンスを1つの配列にする
    @timelines = reviews | previews
    # 作成降順に並び替え
    @timelines.sort!{ |a, b| b.created_at <=> a.created_at }
=======
    @reviews = Review.all
    @previews = Preview.all
>>>>>>> 231ee6b9a9677c622bfe76bff6b1f281a789c82f
  end

  def about
  end
end
