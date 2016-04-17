class Point < ActiveRecord::Base
  belongs_to :user

  validates :value, presence: true, numericality: { only_integer: true }
  validates :user_id, presence: true, numericality: { only_integer: true }

end
