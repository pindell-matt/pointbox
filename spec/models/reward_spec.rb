require 'rails_helper'

RSpec.describe Reward, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  context "associations" do
    it { should have_many(:user_rewards) }
    it { should have_many(:users).through(:user_rewards) }
  end
end
