class RemoveTeamIdFromUser < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :team_id, :integer
  end
end
