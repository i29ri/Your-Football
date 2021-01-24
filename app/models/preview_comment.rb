class PreviewComment < ApplicationRecord
  # ==============アソシエーション ================================
  # user,previewとの１対Nの関係
  belongs_to :user
  belongs_to :preview
end
