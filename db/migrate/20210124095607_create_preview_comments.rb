class CreatePreviewComments < ActiveRecord::Migration[5.2]
  def change
    create_table :preview_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :preview_id

      t.timestamps
    end
  end
end
