class Team < ApplicationRecord

  attachment :image_id


  # ==============アソシエーション ================================
  #Userは推しチームを１チーム持つことができる
  has_many :users, dependent: :destroy

# ====================自分がフォローしているユーザーとの関連 ===================================
  #フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。なので親はfollowing_id(フォローする側)
  has_many :home_relationships, class_name: "TeamRelationship", foreign_key: :home_id
  # 中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「followings」と定義
  has_many :homes, through: :home_relationships, source: :away
  # ========================================================================================

  # ====================自分がフォローされるユーザーとの関連 ===================================
  #フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親はfollower_id(フォローされる側)
  has_many :away_relationships, class_name: "TeamRelationship", foreign_key: :away_id
  # 中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「followers」と定義
  has_many :aways, through: :away_relationships, source: :away
  # =======================================================================================
end
