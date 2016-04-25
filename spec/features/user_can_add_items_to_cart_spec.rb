require "rails_helper"

RSpec.feature "User can add an item to their cart" do
  scenario "they see the contents" do
    create_list(:item, 2)

    item_1 = Item.first
    item_2 = Item.last

    visit items_path

    expect(page).to have_button("Add to Cart")

    within(".card-#{item_1.id}") do
      click_button("Add to Cart")
    end

    expect(current_path).to eq(items_path)

    click_link("shopping_cart")

    expect(current_path).to eq(cart_path)

    within("ul.collection:nth-child(1)") do
      expect(page).to have_content(item_1.title)
      expect(page).to have_content(item_1.price)
      expect(page).to have_content(item_1.description)
    end
    expect(page).to have_content("Total: 9.99")

    visit items_path

    within(".card-#{item_2.id}") do
      click_button("Add to Cart")
    end
    click_link("shopping_cart")

    expect(current_path).to eq(cart_path)
    within("li.collection-item:nth-child(1)") do
      expect(page).to have_content(item_1.title)
      expect(page).to have_content(item_1.price)
      expect(page).to have_content(item_1.description)
    end
    within("li.collection-item:nth-child(2)") do
      expect(page).to have_content(item_2.title)
      expect(page).to have_content(item_2.price)
      expect(page).to have_content(item_2.description)
    end
    expect(page).to have_content("Total: 19.98")
  end
end
