class PreviewFavorite < ApplicationRecord
  # ==============アソシエーション ================================
  # user,previewとの１対Nの関係
  belongs_to :user
  belongs_to :preview

  # ==============バリデーション ================================
  # 1人が１つのプレビューに対して、１つしかいいねをつけられないようにする
  validates_uniqueness_of :preview, scope: :user_id

end
