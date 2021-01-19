class Review < ApplicationRecord

  # ==============アソシエーション ================================
  # user,matchとの１対Nの関係
  belongs_to :user
  belongs_to :match
  #１つのレビューに複数のいいねが持てる
  has_many :review_favorites, dependent: :destroy

  # ==================メソッド===================================

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
