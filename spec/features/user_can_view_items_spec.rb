require 'rails_helper'

RSpec.feature "User can view items index" do
  scenario "they see all items on the page" do
    # As a visitor
    # When I visit /items
    # I can see all items
    item_1 = Item.create(title: "item 1",
                         description: "This is the first item",
                         price: 9.99,
                         image_path: "example.image")
    item_2 = Item.create(title: "item 2",
                         description: "This is the second item",
                         price: 5.99,
                         image_path: "example.image/2")

    visit items_path

    expect(page).to have_content("item 1")
    expect(page).to have_content("9.99")
    expect(page).to have_css("img[src=\"#{item_1.image_path}\"]")

    expect(page).to have_content("item 2")
    expect(page).to have_content("5.99")
    expect(page).to have_css("img[src=\"#{item_2.image_path}\"]")
  end
end
