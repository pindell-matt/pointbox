require 'rails_helper'

RSpec.feature "Admin can edit reward" do
  scenario "edits pre-existing reward" do
    reward = create(:reward)
    admin  = User.create(username: "admin",
                         password: "password",
                         role:     1)

    new_name  = "Edited #{reward.name}"
    new_value = "0"

    visit login_path
    fill_in "username", with: "admin"
    fill_in "password", with: "password"
    click_button "Login"

    click_link "Rewards Shop"
    expect(page).to have_content("#{reward.name}: #{reward.value} points")

    click_button "Edit"

    fill_in "name", with: new_name
    fill_in "value", with: new_value
    click_button "Update Reward"

    expect(page).to have_content("#{new_name}: #{new_value} points")
  end
end
