class AddSeasonToMatch < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :season, :integer
    add_column :matches, :section, :integer
  end
end
