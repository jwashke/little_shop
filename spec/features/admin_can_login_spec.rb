require "rails_helper"

RSpec.feature "Admin can login" do
  scenario "and be taken to the admin dashboard" do
    admin = User.create(
      email: "admin@example.com",
      password: "password",
      first_name: "first name",
      last_name: "last name",
      address: "address",
      city: "city",
      state: "state",
      zip: "zip",
      role: 1
    )
    visit login_path

    within("#login-form") do
      fill_in :Email, with: "admin@example.com"
      fill_in :Password, with: "password"
      click_button("Login")
    end

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Admin Dashboard")
  end
end
