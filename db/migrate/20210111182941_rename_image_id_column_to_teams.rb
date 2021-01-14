class RenameImageIdColumnToTeams < ActiveRecord::Migration[5.2]
  def change
    rename_column :teams, :image_id, :image
  end
end
