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
  end
end
