class Match < ApplicationRecord
  
  # ==============アソシエーション ================================
  
  # team_relationshipとの１対Nの関係
  belongs_to :team_relationship
  #matchは複数のプレビューを持つことができる
  has_many :preview, dependent: :destroy
  #matchは複数のレビューを持つことができる
  has_many :review, dependent: :destroy
end
