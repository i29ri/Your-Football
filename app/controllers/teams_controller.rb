class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.find(params[:id])
  end

  def show
    @team = Team.find(params[:id])
    # @team = TeamRelationship.find(params[:home_id], [:away_id])
    # @team = Match.find(params[id])
    @matches = @team.team_relationship.matches
  end
end
