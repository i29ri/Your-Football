class TeamRelationshipController < ApplicationController
  def create
    @team_relationship = TeamRelationship.find(params[:id])
  end

  def destroy
  end
end
