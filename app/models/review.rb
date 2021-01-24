class Review < ApplicationRecord

  # ==============バリデーション ================================

  validates :comment, length: { in: 0..500 }
  # rating 1 ~ 10まで1
  validates :rating, numericality: {
    less_than_or_equal_to: 10,
    greater_than_or_equal_to: 1
  }, presence: true
  # ==============アソシエーション ================================
  # user,matchとの１対Nの関係
  belongs_to :user
  belongs_to :match
  # 1つのレビューに複数のいいねが持てる
  has_many :review_favorites, dependent: :destroy


  # ==================メソッド===================================

  def favorited_by?(user)
    review_favorites.where(user_id: user.id).exists?
  end
end
