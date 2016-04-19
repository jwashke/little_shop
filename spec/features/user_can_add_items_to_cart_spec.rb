
#       I should see a link or button for "Add to Cart"
#       When I click "Add to cart" for that item
#       And I click a link or button to view cart
#       And my current path should be "/cart"
#       And I should see a small image, title, description and price for the item I just added
#       And there should be a "total" price for the cart that should be the sum of all items in the cart

require "rails_helper"

RSpec.feature "User can add an item to their cart" do
  scenario 'they see the contents' do
    item = create_items

    visit items_path

    expect(page).to have_button("Add to Cart")

    first(:button, "Add to Cart").click

    expect(current_path).to eq(items_path)

    click_link "Cart"

    expect(current_path).to eq(cart_path)
    save_and_open_page
    within("ul.collection:nth-child(1)") do
      expect(page).to have_content("item 1")
      expect(page).to have_content("9.99")
      expect(page).to have_content("This is the first item")
      expect(page).to have_css("img[src=\"/images/example.image\"]")
    end
    expect(page).to have_content("Total: 9.99")

    visit items_path

    last(:link, "Add to Cart").click
    click_link "Cart"

    expect(current_path).to eq(cart_path)
    within("ul.collection:nth-child(1)") do
      expect(page).to have_content("item 1")
      expect(page).to have_content("9.99")
      expect(page).to have_content("This is the first item")
      expect(page).to have_css("img[src=\"/images/example.image\"]")
    end
    within("ul.collection:nth-child(2)") do
      expect(page).to have_content("item 2")
      expect(page).to have_content("5.99")
      expect(page).to have_content("This is the second item")
      expect(page).to have_css("img[src=\"/images/example.image/2\"]")
    end
    expect(page).to have_content("Total: 15.98")
  end
end
