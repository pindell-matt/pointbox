class Point < ActiveRecord::Base
  belongs_to :user

  validates :value, presence: true
  validates :user_id, presence: true
  # validates :spent, presence:true

end
