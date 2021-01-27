class ReviewFavorite < ApplicationRecord
  # ==============アソシエーション ================================
  # user,reviewとの１対Nの関係
  belongs_to :user
  belongs_to :review
  # 1人が１つのレビューに対して、１つしかいいねをつけられないようにする
  validates_uniqueness_of :review, scope: :user_id
end
