class User < ActiveRecord::Base
  has_secure_password

  has_many :points
  has_many :user_rewards
  has_many :rewards, through: :user_rewards

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

   enum role: %w(default admin)

   def total_points
     Point.find_by(user_id: id).value
   end
end
