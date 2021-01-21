class ReviewFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :review
  # 1人が１つのレビューに対して、１つしかいいねをつけられないようにする
  # validates_uniqueness_of :review_id, scope: :user_id


end
