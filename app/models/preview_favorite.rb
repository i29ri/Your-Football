class PreviewFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :preview
  # 1人が１つのプレビューに対して、１つしかいいねをつけられないようにする
  validates_uniqueness_of :preview, scope: :user_id

end
