class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.integer :match_id
      t.string :name
      t.string :image_id

      t.timestamps
    end
  end
end
