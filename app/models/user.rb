class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Refile
  attachment :profile_image


  # ==============バリデーション ================================
  # ニックネームは２～１４字まで　一意を要求
  validates :nickname, presence: true, uniqueness: true, length: { in: 2..14 }
  # validates :team_id, presence: true, uniqueness: true, length: { in: 2..14 }

  # yourfootIDは半角英数字のみの４～２０字　一意を要求
  VALID_YOURFOOTID_REGEX = /\A[a-z0-9]+\z/
  validates :yourfoot_ID, presence: true, uniqueness: true, length: { in: 4..20 }, format: { with: VALID_YOURFOOTID_REGEX }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  #  備考：パスワードデフォルトで６文字以上を要求している

  # ==============アソシエーション ================================
  has_many :user_relationships
  #followingクラスに、中間テーブル(user_relationships)の、（follow_id）を参考にしてフォローしているユーザーIDを取得するよう要求
  has_many :followings, through: :user_relationships, source: :follow
  #reverse_of_user_relationshipsクラスに、中間テーブル(user_relationships)の、（follow_id）から(user_id)を取得するよう要求
  has_many :reverse_of_user_relationships, class_name: 'UserRelationship', foreign_key: 'follow_id', dependent: :destroy
  #followersクラスに、中間テーブル(reverse_of_user_relationships)の（user_id）を参考に、（follow_id）取得するよう要求
  has_many :followers, through: :reverse_of_user_relationships, source: :user
  #Userは推しチームを１チーム持つことができる
  has_one :pickteam, dependent: :destroy
  #Userは複数のレビュープレビューを書くことができる
  has_many :preview, dependent: :destroy
  has_many :review, dependent: :destroy
  #Userは複数のレビュー・プレビューにいいね・コメントすることができる
  has_many :preview_favorites, dependent: :destroy
  has_many :review_favorites, dependent: :destroy
  has_many :preview_comments, dependent: :destroy
  has_many :review_comments, dependent: :destroy

  # ==================メソッド===================================
  #　user/show,user/editページにアクセスした際のURLを yourfootIDで表示
  def to_param
    yourfoot_ID
  end

  #フォローしようとしているユーザーが自分自身でないか。そして既にフォローされてなければフォローする。
  def follow(other_user)
    unless self == other_user
      self.user_relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  # user_relationshipが存在すれば、フォロー解除
  def unfollow(other_user)
    user_relationship = self.user_relationships.find_by(follow_id: other_user.id)
    user_relationship.destroy if user_relationship
  end

  # フォロー済かどうかの確認
  def following?(other_user)
    self.followings.include?(other_user)
  end
  # 大会後もユーザーのデータは残しておくため、論理削除
  enum is_deleted: { '退会済': true, '有効': false }

  def active_for_authentication?
    super && self.is_deleted == '有効'
  end

  def favorited_by?(review_id)
    review_favorites.where(review_id: review_id).exists?
  end

end
