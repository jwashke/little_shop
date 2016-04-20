require "rails_helper"

RSpec.feature "Visitor can visit login page" do
  scenario "click on create account and see the form to create an account" do
    visit root_path
    within(".nav-wrapper") do
      expect(page).to have_content("Login")
    end

    click_link("Login")

    expect(current_path).to eq(login_path)

    within("#login-form") do
      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
      expect(page).to have_button("Login")
    end

    within("#create-form") do
      expect(page).to have_button("Create Account")
    end
  end

  scenario "" do

  end

end
