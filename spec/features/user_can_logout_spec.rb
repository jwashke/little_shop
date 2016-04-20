require "rails_helper"

RSpec.feature "User can logout" do
  scenario "He sees the login link and an empty cart" do
  #   As a user
  # When i am logged in
  # I can click the loggout link
  # and i shouldnt see logout
  # and I should see a link to login
  # and when I click on the cart
  # The cart should be empty
    create_user
    create_items
    item = Item.first

    visit login_path

    within("#login-form") do
      fill_in :Email, with: "user@example.com"
      fill_in :Password, with: "password"
      click_button("Login")
    end

    visit root_path

    within(".card-#{item.id}") do
      click_button("Add to Cart")
    end
    #save_and_open_page
    click_link("Logout")

    expect(page).to have_content("Login")
    expect(page).not_to have_content("Logout")

    within(".nav-wrapper") do
      click_link("Cart")
    end

    expect(page).not_to have_content("#{item.title}")

  end
end
