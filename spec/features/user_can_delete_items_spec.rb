require "rails_helper"

RSpec.feature "User can delete an item from cart and undo" do
  scenario "they see updated cart" do
    item = create(:item)

    visit items_path

    within(".card-#{item.id}") do
      click_button("Add to Cart")
    end

    visit cart_path

    expect(page).to have_content item.title
    expect(page).to have_content item.price
    click_on "Delete"
    expect(page).to have_content "Removed #{item.title}"

    expect(page).not_to have_content item.price

    click_on "Put one back?"

    expect(page).to have_content item.title
    expect(page).to have_content item.price
  end
end
