require "rails_helper"

RSpec.feature "User can add an item to their cart" do
  scenario "they see the contents" do
    create_items

    item_1 = Item.first
    item_2 = Item.last

    visit items_path

    expect(page).to have_button("Add to Cart")

    within(".card-#{item_1.id}") do
      click_button("Add to Cart")
    end

    expect(current_path).to eq(items_path)

    click_link "Cart"

    expect(current_path).to eq(cart_path)

    within("ul.collection:nth-child(1)") do
      expect(page).to have_content("item 1")
      expect(page).to have_content("9.99")
      expect(page).to have_content("This is the first item")
      expect(page).to have_css("img[src=\"/images/example.image\"]")
    end
    expect(page).to have_content("Total: 9.99")

    visit items_path

    within(".card-#{item_2.id}") do
      click_button("Add to Cart")
    end
    click_link "Cart"

    expect(current_path).to eq(cart_path)
    within("li.collection-item:nth-child(1)") do
      expect(page).to have_content("item 1")
      expect(page).to have_content("9.99")
      expect(page).to have_content("This is the first item")
      expect(page).to have_css("img[src=\"/images/example.image\"]")
    end
    within("li.collection-item:nth-child(2)") do
      expect(page).to have_content("item 2")
      expect(page).to have_content("5.99")
      expect(page).to have_content("This is the second item")
      expect(page).to have_css("img[src=\"/images/example.image/2\"]")
    end
    expect(page).to have_content("Total: 15.98")
  end
end
