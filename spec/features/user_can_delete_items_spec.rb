require "rails_helper"

RSpec.feature "User can delete an item from cart and undo" do
  scenario "they see updated cart" do
    create_items
    item_1 = Item.first

    visit items_path

    within(".card-#{item_1.id}") do
      click_button("Add to Cart")
    end

    visit cart_path

    expect(page).to have_content "item 1"
    expect(page).to have_content "9.99"
    click_on "Delete"
    expect(page).to have_content "Removed #{item_1.title}"

    expect(page).not_to have_content "9.99"

    click_on "Put one back?"

    expect(page).to have_content "item 1"
    expect(page).to have_content "9.99"
  end
end
