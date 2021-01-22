class Preview < ApplicationRecord

  # ==============アソシエーション ================================
  # user,matchとの１対Nの関係
  belongs_to :user
  belongs_to :match
  # 1つのレビューに複数のいいねが持てる
  has_many :preview_favorites, dependent: :destroy


  # ==================メソッド===================================

  def favorited_by?(user)
    peview_favorites.where(user_id: user.id).exists?
  end
end