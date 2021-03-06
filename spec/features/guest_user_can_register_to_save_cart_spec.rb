require "rails_helper"

RSpec.feature "User can register an account" do
  scenario "Their cart is saved" do
    create_list(:item, 2)

    item_1 = Item.first
    item_2 = Item.last

    visit root_path

    within(".card-#{item_1.id}") do
      click_button("Add to Cart")
    end

    within(".card-#{item_2.id}") do
      click_button("Add to Cart")
    end

    within(".nav-wrapper") do
      click_link("shopping_cart")
    end

    click_button("Create Account to Checkout")

    within("#create-form") do
      fill_in :Email, with: "user@example.com"
      fill_in :Password, with: "password"
      fill_in "Name", with: "Josh"
      click_button("Create Account")
    end

    within(".nav-wrapper") do
      click_link("shopping_cart")
    end

    expect(page).to have_content("#{item_1.title}")
    expect(page).to have_content("#{item_2.title}")
  end
end
