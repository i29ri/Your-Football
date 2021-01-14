class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.integer :team_relationship_id
      t.datetime :match_day
      t.integer :home_goal
      t.integer :away_goal
      t.integer :home_points
      t.integer :away_points
      t.string :stadium_name
      t.boolean :is_held, default: false

      t.timestamps
    end
  end
end
