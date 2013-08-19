class Workout < ActiveRecord::Base
belongs_to :user

  validates :user_id, presence: true
  validates :category,  presence: true
  validates :day,  presence: true
  validates :name,  presence: true
  validates :description,  presence: true
  validates :set,  presence: true
  validates :rep,  presence: true
  validates :duration,  presence: true
  validates :rest,  presence: true
  validates :note,  presence: true

  default_scope -> { order('workouts.created_at DESC') }

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end