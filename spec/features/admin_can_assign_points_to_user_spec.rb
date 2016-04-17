require 'rails_helper'

RSpec.feature "Admin can assign points to user" do
  scenario "with valid params" do
    user  = create(:user)
    admin = User.create(username: "admin",
                        password: "password",
                        role:     1)

    visit login_path
    fill_in "username", with: "admin"
    fill_in "password", with: "password"
    click_button "Login"

    click_link "Users Index"
    click_link user.username
    click_link "Add Points to #{user.username}"

    fill_in "point_value", with: 5
    click_button "Assign"

    expect(page).to have_content "Points Assigned!"
    expect(page).to have_content "User #{user.id}: #{user.username}"
    expect(page).to have_content "Total Points: 5"
  end

  scenario "with invalid params" do
    user  = create(:user)
    admin = User.create(username: "admin",
                        password: "password",
                        role:     1)

    visit login_path
    fill_in "username", with: "admin"
    fill_in "password", with: "password"
    click_button "Login"

    click_link "Users Index"
    click_link user.username
    click_link "Add Points to #{user.username}"

    click_button "Assign"

    expect(page).to have_content "Invalid. Try Again."
  end
end
