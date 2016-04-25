require "rails_helper"

RSpec.feature "User can view items index" do
  scenario "they see all items on the page" do
    create_list(:item, 2)
    item_1 = Item.first
    item_2 = Item.last

    visit items_path

    expect(page).to have_content(item_1.title)
    expect(page).to have_content(item_1.price)

    expect(page).to have_content(item_2.title)
    expect(page).to have_content(item_2.price)
  end
end
