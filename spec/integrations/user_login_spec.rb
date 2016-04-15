require 'rails_helper'

RSpec.feature "User logs in to website" do
  scenario "user creates account and logs in" do
    visit new_user_path

    fill_in "username", with: "Fakename"
    fill_in "password", with: "password"
    click_button "Create Account"

    expect(page).to have_content("Welcome, Fakename")
    expect(page).to have_content("Logout")
    expect(page).to have_content("My Spent Points")
    expect(page).to have_content("My Unspent Points")
  end

  scenario "existing user can login" do
    user = create(:user)

    visit login_path
    fill_in "username", with: "Clarence"
    fill_in "password", with: "password"
    click_button "Login"

    expect(page).to have_content("Welcome, Clarence")
    expect(page).to have_content("Logout")
    expect(page).to have_content("My Spent Points")
    expect(page).to have_content("My Unspent Points")
  end

  # sad path
  # context "the submitted login data is invalid" do
end
