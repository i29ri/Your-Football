class RemoveTeamRelationshipIdFromMatches < ActiveRecord::Migration[5.2]
  def change
    remove_column :matches, :team_relationship_id, :integer
  end
end
