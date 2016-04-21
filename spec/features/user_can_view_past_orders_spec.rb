require "rails_helper"

RSpec.feature "User can view orders" do
  scenario "they see an order breakdown" do

    user = create_user

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    create_items

    item_1 = Item.first
    item_2 = Item.last

    visit items_path
    within(".card-#{item_1.id}") do
      click_button("Add to Cart")
    end

    within(".card-#{item_2.id}") do
      click_button("Add to Cart")
    end

    visit cart_path
    click_on "Checkout"
    expect(page).to have_content("Order History")

    within(".highlight") do
      expect(page).to have_content("item 1")
      expect(page).to have_content("item 2")
      expect(page).to have_content("9.99")
      expect(page).to have_content("5.99")
    end
  end
end
