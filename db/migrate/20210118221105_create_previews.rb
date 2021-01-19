class CreatePreviews < ActiveRecord::Migration[5.2]
  def change
    create_table :previews do |t|
      t.text :comment
      t.integer :user_id
      t.integer :match_id

      t.timestamps
    end
  end
end
