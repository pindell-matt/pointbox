require 'rails_helper'

RSpec.feature "Admin views all rewards" do
  scenario "sees reward index" do
    reward = create(:reward)
    admin  = User.create(username: "admin",
                         password: "password",
                         role:     1)

    visit login_path
    fill_in "username", with: "admin"
    fill_in "password", with: "password"
    click_button "Login"

    click_link "Rewards Gallery"

    expect(page).to have_content("#{reward.name}")
    expect(page).to have_content("#{reward.value}")
    expect(page).to have_button("Edit")
    expect(page).to have_button("Delete")
  end
end
