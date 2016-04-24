require "rails_helper"

RSpec.feature "Unauth user cannot view current order" do
  scenario "they are redirected to login" do
    user = create_user
    create_items
    visit login_path

    within("#login-form") do
      fill_in :Email, with: "user@example.com"
      fill_in :Password, with: "password"
    end
    click_button "Login"
    visit items_path
    item_1 = Item.first
    within(".card-#{item_1.id}") do
      click_button("Add to Cart")
    end

    visit cart_path

    expect(page).to have_content "Item 1"

    click_on "Logout"

    visit cart_path

    expect(page).not_to have_content "Item 1"

    visit orders_path
    expect(page).to have_content("Enter your information to login")

    visit admin_dashboard_path
    expect(page).to have_content("404")
  end
end
