require 'rails_helper'

RSpec.feature "Admin creates reward" do
  scenario "with valid input" do
    admin  = User.create(username: "admin",
                         password: "password",
                         role:     1)

    visit login_path
    fill_in "username", with: "admin"
    fill_in "password", with: "password"
    click_button "Login"

    click_link "Rewards Gallery"

    click_button "Create New Reward"

    fill_in "name", with: "Test-Trophy"
    fill_in "value", with: 5
    click_button "Create Reward"

    expect(page).to have_content("Reward Created!")
    expect(page).to have_content("Test-Trophy")
    expect(page).to have_content("5")
  end

  scenario "with invalid input" do
    admin  = User.create(username: "admin",
                         password: "password",
                         role:     1)

    visit login_path
    fill_in "username", with: "admin"
    fill_in "password", with: "password"
    click_button "Login"

    click_link "Rewards Gallery"

    click_button "Create New Reward"

    fill_in "name", with: "Test-Trophy"
    click_button "Create Reward"

    expect(page).to have_content("New Reward")
  end

end
