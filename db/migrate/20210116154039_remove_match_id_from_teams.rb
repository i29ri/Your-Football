class RemoveMatchIdFromTeams < ActiveRecord::Migration[5.2]
  def change
    remove_column :teams, :match_id, :integer
  end
end
