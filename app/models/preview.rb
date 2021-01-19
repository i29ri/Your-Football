class Preview < ApplicationRecord
  # user,matchとの１対Nの関係
  belongs_to :user
  belongs_to :match
  #１つのプレビューに複数のいいねが持てる
  has_many :preview_favorites, dependent: :destroy
end
