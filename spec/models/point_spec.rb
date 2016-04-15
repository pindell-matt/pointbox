require 'rails_helper'

RSpec.describe Point, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:spent) }
  end

  context "associations" do
    it { should belong_to(:user) }
  end
end
