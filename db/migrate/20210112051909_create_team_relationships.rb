class CreateTeamRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :team_relationships do |t|
      t.integer :home_id
      t.integer :away_id

      t.timestamps
    end
  end
end
