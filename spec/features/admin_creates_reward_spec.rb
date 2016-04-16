require 'rails_helper'

RSpec.feature "Admin creates reward" do
  scenario "with valid input" do
    reward = create(:reward)

    visit admin_rewards_path

    click_link "New Reward"
    fill_in "name", with: reward.name
    fill_in "value", with: reward.value
    click_button "Create Reward"

    expect(page).to have_content "Reward Created!"
    
  end
end
