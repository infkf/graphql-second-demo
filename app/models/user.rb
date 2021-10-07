class User < ApplicationRecord
  has_secure_password
  has_many :tweets
  has_many :badges, through: :badges_users

  has_many :user_relationship_followers, foreign_key: :followee_id, class_name: 'UserRelationship'
  has_many :followers, through: :user_relationship_followers, source: :follower

  has_many :user_relationship_followees, foreign_key: :follower_id, class_name: 'UserRelationship'
  has_many :followees, through: :user_relationship_followees, source: :followee

  def follow(user_id)
    UserRelationship.create(follower_id: id, followee_id: user_id)
  end

  def add_badge(badge)
    BadgeUser.create(user: self, badge: badge)
  end

  def tweet(msg)
    tweets.create(message: msg)
  end
end
