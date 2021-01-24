class ReviewComment < ApplicationRecord
  # ==============アソシエーション ================================
  # user,reviewとの１対Nの関係
  belongs_to :user
  belongs_to :review
end
