require 'rails_helper'

RSpec.feature "Admin can delete reward" do
  scenario "deletes pre-existing reward" do
    reward = create(:reward)
    admin  = User.create(username: "admin",
                         password: "password",
                         role:     1)

    visit login_path
    fill_in "username", with: "admin"
    fill_in "password", with: "password"
    click_button "Login"

    click_link "Rewards Shop"
    click_button "Delete"

    expect(page).to have_content("Rewards Index")
    expect(page).to_not have_content("#{reward.name}: #{reward.value} points")
    expect(page).to_not have_button("Edit")
    expect(page).to_not have_button("Delete")
  end
end
