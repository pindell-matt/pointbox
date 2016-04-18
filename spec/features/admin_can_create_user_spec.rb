require 'rails_helper'

RSpec.feature "Admin creates user" do
  scenario "with valid input" do
    admin  = User.create(username: "admin",
                         password: "password",
                         role:     1)

    visit login_path
    fill_in "username", with: "admin"
    fill_in "password", with: "password"
    click_button "Login"

    click_link "Users Index"

    click_button "Create New User"

    fill_in "username", with: "DIY User"
    fill_in "password", with: "password"
    click_button "Create User"

    expect(page).to have_content("User Successfully Created!")
    expect(page).to have_content("DIY User")
  end

  scenario "with invalid input" do
    admin  = User.create(username: "admin",
                         password: "password",
                         role:     1)

    visit login_path
    fill_in "username", with: "admin"
    fill_in "password", with: "password"
    click_button "Login"

    click_link "Users Index"

    click_button "Create New User"

    fill_in "username", with: "DIY User"
    click_button "Create User"

    expect(page).to have_content("Invalid Submission!")
    expect(page).to_not have_content("DIY User")
  end



end
