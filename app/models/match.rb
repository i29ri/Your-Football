class Match < ApplicationRecord

  # ==============アソシエーション ================================

  # matchは複数のチームリレーションシップを持つことができる
  has_many :team_relationships, dependent: :destroy
  # matchは複数のプレビューを持つことができる
  has_many :preview, dependent: :destroy
  # matchは複数のレビューを持つことができる
  has_many :review, dependent: :destroy
end
