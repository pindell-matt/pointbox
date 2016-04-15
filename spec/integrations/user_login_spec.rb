require 'rails_helper'

RSpec.feature "User logs in to website" do
  scenario "existing user can login" do
    User.create(username: "Clarence",
                password: "password")

    visit login_path
    fill_in "Username", with: "Clarence"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(page).to have_content("User Show Page")
    expect(page).to have_content("Logout")
    expect(page).to have_content("My Spent Points")
    expect(page).to have_content("My Unspent Points")
  end
end
