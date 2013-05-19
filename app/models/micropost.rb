class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user

  has_many :reverse_memberships, foreign_key: "member_of_id",
                                 class_name: "Membership",
                                 dependent: :destroy
  has_many :members, through: :reverse_memberships, source: :member

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  default_scope order: 'microposts.created_at DESC'

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end
end
