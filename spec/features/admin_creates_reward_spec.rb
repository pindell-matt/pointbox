require 'rails_helper'

RSpec.feature "Admin creates reward" do
  scenario "with valid input" do
    reward = create(:reward)
    admin  = User.create(username: "admin",
                         password: "password",
                         role:     1)

    visit login_path
    fill_in "username", with: "admin"
    fill_in "password", with: "password"
    click_button "Login"

    click_link "Create New Reward"

    fill_in "name", with: reward.name
    fill_in "value", with: reward.value
    click_button "Create Reward"

    # save_and_open_page
    expect(page).to have_content("Reward Created!")
  end
end
