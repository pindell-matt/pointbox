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

    click_link "Purchase A Reward"

    select('Trophy: 0 points', from: 'user_rewards')

    click_button "Purchase Reward"

    expect(page).to have_content "Reward Purchased!"

    within(".user_rewards") do
      expect(page).to have_content "Trophy"
    end
  end

  scenario "with 1 point reward" do
    user   = create(:user)
    reward = Reward.create(name:  "Expensive Trophy",
                           value: 1)

    user.points.create(value: 1)

    visit login_path
    fill_in "username", with: user.username
    fill_in "password", with: "password"
    click_button "Login"

    click_link "Purchase A Reward"

    select('Expensive Trophy: 1 points', from: 'user_rewards')

    click_button "Purchase Reward"

    expect(page).to have_content "Reward Purchased!"
    expect(page).to have_content "Points: 0"
    expect(page).to have_content "Spent: 1"

    within(".user_rewards") do
      expect(page).to have_content "Expensive Trophy"
    end
  end

  scenario "without enough points" do
    user   = create(:user)
    reward = Reward.create(name:  "Expensive Trophy",
                           value: 1)

    visit login_path
    fill_in "username", with: user.username
    fill_in "password", with: "password"
    click_button "Login"

    click_link "Purchase A Reward"

    select('Expensive Trophy: 1 points', from: 'user_rewards')

    click_button "Purchase Reward"

    expect(page).to have_content "Insufficient Funds, Yo!"
  end
end
