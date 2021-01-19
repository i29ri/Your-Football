class CreatePreviewFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :preview_favorites do |t|
      t.integer :user_id
      t.integer :preview_id
      t.timestamps
    end
  end
end
