class Preview < ApplicationRecord
  # ==============バリデーション ================================
  validates :comment, length: { in: 0..500 }
  # ==============アソシエーション ================================
  # user,matchとの１対Nの関係
  belongs_to :user
  belongs_to :match
  # 1つのレビューに複数のいいねが持てる
  has_many :preview_favorites, dependent: :destroy
  has_many :preview_comments, dependent: :destroy
  # 1人が１つの試合に対して、１つしかプレビューをつけられないようにする
  validates_uniqueness_of :match, scope: :user_id

  # ==================メソッド===================================

  def favorited_by?(user)
    peview_favorites.where(user_id: user.id).exists?
  end
end
