class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def show
    @matches = Match.find(params[:id])
  end

  def create
    @match = Match.find(params[:id])
  end
end
