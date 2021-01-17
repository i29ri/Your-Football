class AddPickteamIdToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :pickteam_id, :integer
  end
end
