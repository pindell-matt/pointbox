class Reward < ActiveRecord::Base
  has_many :user_rewards
  has_many :users, through: :user_rewards

  validates :name, presence: true, uniqueness: true
  validates :value, presence: true

  def name_and_value
    "#{name}: #{value} points"
  end

end
