require "rails_helper"

RSpec.feature "User can only view their orders" do
  scenario "their order history reflects appropriately" do
    create_user
    create_second_user
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
    click_on "Checkout"
    expect(page).to have_content "9.99"

    click_on "Logout"

    visit login_path

    within("#login-form") do
      fill_in :Email, with: "user2@example.com"
      fill_in :Password, with: "password"
    end

    click_button "Login"

    visit orders_path
    expect(page).not_to have_content "9.99"
  end
end
