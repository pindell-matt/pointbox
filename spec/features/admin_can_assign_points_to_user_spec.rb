require 'rails_helper'

RSpec.feature "Admin can assign points to user" do
  scenario "assigns points to existing user" do
    user   = create(:user)
    admin  = User.create(username: "admin",
                         password: "password",
                         role:     1)

    visit login_path
    fill_in "username", with: "admin"
    fill_in "password", with: "password"
    click_button "Login"

    click_link "Assign Points"
    fill_in "value", with: 5
    fill_in "user id", with: user.id
    click_button "Assign"

    expect(page).to have_content "#{user.username}"
    expect(page).to have_content "Total Points: 5"
  end
end
