require 'rails_helper'

RSpec.feature "User can purchase reward with points" do
  scenario "with free reward" do
    user   = create(:user)
    reward = Reward.create(name:  "Trophy",
                           value: 0)

    visit login_path
    fill_in "username", with: user.username
    fill_in "password", with: "password"
    click_button "Login"

    # click_link "Get Rewards"


    # expect(page).to have_content "Points Assigned!"
    # expect(page).to have_content "User #{user.id}: #{user.username}"
    # expect(page).to have_content "Total Points: 5"
  end

  scenario "with 1 point reward" do

  end

  scenario "without enough points" do

  end
end
