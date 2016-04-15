FactoryGirl.define do

  sequence :username do |n|
    "#{n} User"
  end

  sequence :name, ["A", "C", "B"].cycle do |n|
    "#{n} Reward"
  end

  sequence :value, ["5", "10", "15"].cycle do |n|
    "#{n}"
  end

  factory :reward do
    name
    value
  end

  factory :user do
    username { generate(:username) }
    password "password"
  end

end
