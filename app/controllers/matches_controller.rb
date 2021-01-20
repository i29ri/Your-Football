class MatchesController < ApplicationController
  def index
    @matches = Match.all
    
  end

  def show
    @match = Match.find(params[:id])
    # @previews = @match.previews
    @reviews = @match.review
    #     @timelines = @match.preview
    # @timelines = @match.review
  end

  def create
    @match = Match.find(params[:id])
  end
end
