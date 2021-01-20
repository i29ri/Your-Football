class Review < ApplicationRecord

  # ==============アソシエーション ================================
  # user,matchとの１対Nの関係
  belongs_to :user
  belongs_to :match
  # 1つのレビューに複数のいいねが持てる
  has_many :review_favorites, dependent: :destroy
  # 1人が１つのレビューに対して、１つしかいいねをつけられないようにする
  validates_uniqueness_of :review_id, scope: :user_id

  # ==================メソッド===================================

  def favorited_by?(user)
    review_favorites.where(user_id: user.id).exists?
  end
end
