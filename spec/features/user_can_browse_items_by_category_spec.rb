require "rails_helper"

RSpec.feature "User can view category index" do
  scenario "they see the items sorted by category" do
    category_1 = Category.create(name: "Haikus")
    category_2 = Category.create(name: "Limericks")
    item_1 = category_1.items.create(title: "item 1",
                         description: "This is the first item",
                         price: 9.99,
                         image_path: "example.image")
    item_2 = category_2.items.create(title: "item 2",
                         description: "This is the second item",
                         price: 5.99,
                         image_path: "example.image/2")

    visit items_path
    click_link("Haikus")

    expect(current_path).to eq(category_path(category_1.name))
    expect(page).to have_content("item 1")
    expect(page).to have_content("9.99")
    expect(page).to have_css("img[src=\"/images/example.image\"]")

    expect(page).not_to have_content("item 2")
    expect(page).not_to have_content("5.99")
    expect(page).not_to have_css("img[src=\"/images/example.image/2\"]")
  end
end
