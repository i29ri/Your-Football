class PreviewFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :preview
end
