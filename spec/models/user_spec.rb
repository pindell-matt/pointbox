require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_uniqueness_of(:username) }
  end

  context "associations" do
    it { should have_many(:points) }
    it { should have_many(:rewards).through(:user_rewards) }
  end
end
