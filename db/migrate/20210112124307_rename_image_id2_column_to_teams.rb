class RenameImageId2ColumnToTeams < ActiveRecord::Migration[5.2]
  def change
    rename_column :teams, :image, :image_id
  end
end
