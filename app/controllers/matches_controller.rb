class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
    # @previews = @match.previews
    #     @timelines = @match.preview
    # @timelines = @match.review
    if @match.review.blank?
      @average_review = 0
    else
      @average_review = @match.review.average(:rating).round(2)
    end
  end

  def create
    @match = Match.find(params[:id])
  end
end
