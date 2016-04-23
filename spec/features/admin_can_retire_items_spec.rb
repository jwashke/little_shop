require "rails_helper"

RSpec.feature "Admin can retire an item" do
  scenario "retired item can not be added to cart" do
    item = Item.create(
      title: "Item 2",
      description: "This is the second item",
      price: 5.99,
      image_path: "example.image/2",
      state: 1)

    visit items_path

    expect(page).to have_content(item.title)

    find("a", text: "Item Retired").click

    click_link("Cart")
    expect(current_path).to eq(cart_path)

    expect(page).not_to have_content(item.title)
  end
end
