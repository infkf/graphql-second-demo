class UserRelationship < ApplicationRecord
  belongs_to :follower, foreign_key: 'follower_id', class_name: 'User'
  belongs_to :followee, foreign_key: 'followee_id', class_name: 'User'

  validates_uniqueness_of :follower_id, scope: :followee_id
end