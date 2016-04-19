require "rails_helper"

RSpec.feature "User can view items index" do
  scenario "they see all items on the page" do
    create_items

    visit items_path

    expect(page).to have_content("item 1")
    expect(page).to have_content("9.99")
    expect(page).to have_css("img[src=\"example.image\"]")

    expect(page).to have_content("item 2")
    expect(page).to have_content("5.99")
    expect(page).to have_css("img[src=\"example.image/2\"]")
  end
end
