class Review < ApplicationRecord

  # ==============バリデーション ================================

  validates :comment, length: { in: 0..500 }
  # rating 1 ~ 10まで1
  validates :rating, numericality: {
    less_than_or_equal_to: 10,
    greater_than_or_equal_to: 1
  }, presence: true

  # 1人が１つの試合に対して、１つしかレビューをつけられないようにする
  validates_uniqueness_of :match, scope: :user_id

  # ==============アソシエーション ================================
  # user,matchとの１対Nの関係
  belongs_to :user
  belongs_to :match
  # 1つのレビューに複数のいいね・コメントが持てる
  has_many :review_favorites, dependent: :destroy
  has_many :review_comments, dependent: :destroy

  # ==================メソッド===================================

  def favorited_by?(user)
    review_favorites.where(user_id: user.id).exists?
  end
end
