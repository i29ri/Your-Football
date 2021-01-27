class Team < ApplicationRecord
  # attachment :image

  # ==============アソシエーション ================================
  # Userは推しチームを１チーム持つことができる
  has_many :pickteams, dependent: :destroy
  # matchは複数のチームリレーションシップを持つことができる
  has_many :team_relationships, dependent: :destroy
  # =======================================================================================
end
