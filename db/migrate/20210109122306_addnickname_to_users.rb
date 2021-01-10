class AddnicknameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :yourfoot_ID, :string
    add_column :users, :nickname, :string
    add_column :users, :profile_image_id, :string
    add_column :users, :introduction, :text
    add_column :users, :is_deleted, :boolean, default: "false"
  end
end
