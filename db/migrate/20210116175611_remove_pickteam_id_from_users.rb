class RemovePickteamIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :pickteam_id, :integer
  end
end
