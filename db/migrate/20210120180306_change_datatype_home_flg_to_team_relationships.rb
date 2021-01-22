class ChangeDatatypeHomeFlgToTeamRelationships < ActiveRecord::Migration[5.2]
  def change
  change_column :team_relationships, :home_flg, :boolean, default: false
  end
end
