require 'rails_helper'

RSpec.feature "User views all rewards" do
  scenario "they see the names of all rewards" do
    user   = create(:user)
    reward = create(:reward)

    visit login_path

    fill_in "username", with: "Clarence"
    fill_in "password", with: "password"
    click_button "Login"

    click_on "Rewards Gallery"

    expect(page).to have_content("Rewards Gallery")
    expect(page).to have_content(reward.name)
    expect(page).to have_content(reward.value)
  end

  scenario "they can see the individual reward page" do
    user   = create(:user)
    reward = create(:reward)

    visit login_path

    fill_in "username", with: "Clarence"
    fill_in "password", with: "password"
    click_button "Login"

    click_on "Rewards Gallery"
    click_on reward.name

    expect(page).to have_content(reward.name)
    expect(page).to have_content(reward.value)
  end
end
