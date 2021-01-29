class Team < ApplicationRecord
  # attachment :image
  mount_uploader :image_id, ImageUploader
  # ==============アソシエーション ================================
  # Userは推しチームを１チーム持つことができる
  has_many :pickteams, dependent: :destroy
  # matchは複数のチームリレーションシップを持つことができる
  has_many :team_relationships, dependent: :destroy
  # =======================================================================================
end
