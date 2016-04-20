require "rails_helper"

RSpec.feature "User can delete an item from their cart" do
  scenario "they see updated cart" do
    create_items
    item_1 = Item.first
    item_2 = Item.last

    visit items_path

    within(".card-#{item_1.id}") do
      click_button("Add to Cart")
    end

    visit cart_path

    expect(page).to have_content "item 1"
    click_on "Delete"
    expect(page).not_to have_content "item 1"

    visit items_path
    # save_and_open_page
    click_link "Cart"
    # save_and_open_page
  end
end
