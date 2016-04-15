require 'rails_helper'

RSpec.feature "User logs in to website" do
  context "the submitted data is valid" do
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
      fill_in "username", with: user.username
      fill_in "password", with: "password"
      click_button "Login"

      expect(page).to have_content("Welcome, #{user.username}")
      expect(page).to have_content("Logout")
      expect(page).to have_content("My Spent Points")
      expect(page).to have_content("My Unspent Points")
    end
  end

  context "the submitted data is invalid" do
    scenario "no username provided on create account" do
      visit new_user_path

      fill_in "password", with: "password"
      click_button "Create Account"

      within("#flash_error") do
        expect(page).to have_content("Invalid. Try Again.")
      end
    end

    scenario "no password provided on create account" do
      visit new_user_path

      fill_in "username", with: "Clarence"
      click_button "Create Account"

      within("#flash_error") do
        expect(page).to have_content("Invalid. Try Again.")
      end
    end

    scenario "no username provided on login" do
      visit login_path

      fill_in "password", with: "password"
      click_button "Login"

      within("#flash_error") do
        expect(page).to have_content("Invalid. Try Again.")
      end
    end

    scenario "no password provided on login" do
      visit login_path

      fill_in "username", with: "Clarence"
      click_button "Login"

      within("#flash_error") do
        expect(page).to have_content("Invalid. Try Again.")
      end
    end

    scenario "wrong password provided on login" do
      visit login_path

      fill_in "username", with: "Clarence"
      fill_in "password", with: "wrong"
      click_button "Login"

      within("#flash_error") do
        expect(page).to have_content("Invalid. Try Again.")
      end
    end

    scenario "wrong username provided on login" do
      visit login_path

      fill_in "username", with: "Not In System"
      fill_in "password", with: "password"
      click_button "Login"

      within("#flash_error") do
        expect(page).to have_content("Invalid. Try Again.")
      end
    end

  end
end
