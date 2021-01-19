class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
    @previews = Preview.all
  end

  def create
    @match = Match.find(params[:id])
  end
end
