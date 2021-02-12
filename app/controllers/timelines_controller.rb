class TimelinesController < ApplicationController
  #全レビュー・プレビューを一覧表示
  def index
      # レビュー・プレビューを全件取得
      reviews = Review.all
      previews = Preview.all
      # それぞれの複数インスタンスを1つの配列にする
      @timelines = reviews | previews
      # 作成降順に並び替え
      @timelines.sort! { |a, b| b.created_at <=> a.created_at }

      @q = Preview.ransack(params[:q])
      @q = Review.ransack(params[:q])
      @timelines = @q.result(distinct: true)
  end
end
