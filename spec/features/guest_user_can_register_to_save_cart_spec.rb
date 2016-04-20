require "rails_helper"

RSpec.feature "User can register an account" do
  scenario "Their cart is saved" do
    create_items

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
      click_link("Cart")
    end
    
    click_button("Create Account to Checkout")

    within("#create-form") do
      fill_in :Email, with: "user@example.com"
      fill_in :Password, with: "password"
      fill_in "First name", with: "Josh"
      fill_in "Last name", with: "Josh"
      fill_in :Address, with: "fake address"
      fill_in :City, with: "Denver"
      fill_in :State, with: "Colorado"
      fill_in :Zip, with: "80123"
      click_button("Create Account")
    end

    within(".nav-wrapper") do
      click_link("Cart")
    end

    expect(page).to have_content("#{item_1.title}")
    expect(page).to have_content("#{item_2.title}")
  end

  # As a visitor when I have items in my cart
  #   And when I visit "/cart"
  #   I should not see an option to "Checkout"
  #   I should see an option to "Login or Create Account to Checkout"
  #   After I create an account
  #   And I visit "/cart
  #   Then I should see all of the data that was there when I was not logged in
  #   When I click "Logout"
  #   Then I should see see "Login"
  #   And I should not see "Logout"
end
