class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy

  has_many :active_relationships, class_name: 'Relationship', foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :followed_id, dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower


  validates :email, :password, presence: true

  def following?(other_user)
    following.exists(other_user)
  end

  def follow!(other_user)
    following << other_user unless following?(other_user) || self == other_user
  end

  def unfollow!(other_user)
    following.delete(other_user)
  end
end
