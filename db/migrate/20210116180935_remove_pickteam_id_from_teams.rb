class RemovePickteamIdFromTeams < ActiveRecord::Migration[5.2]
  def change
    remove_column :teams, :pickteam_id, :integer
  end
end
