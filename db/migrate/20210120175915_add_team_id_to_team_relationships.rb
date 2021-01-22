class AddTeamIdToTeamRelationships < ActiveRecord::Migration[5.2]
  def change
    add_column :team_relationships, :match_id, :integer
    add_column :team_relationships, :team_id, :integer
    add_column :team_relationships, :home_flg, :boolean
    remove_column :team_relationships, :home_id, :string
    remove_column :team_relationships, :away_id, :string

  end
end
