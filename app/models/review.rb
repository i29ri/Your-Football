class Review < ApplicationRecord
  # user,matchとの１対Nの関係
  belongs_to :user
  belongs_to :match
end
