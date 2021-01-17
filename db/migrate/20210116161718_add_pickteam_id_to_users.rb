class AddPickteamIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pickteam_id, :integer
  end
end
