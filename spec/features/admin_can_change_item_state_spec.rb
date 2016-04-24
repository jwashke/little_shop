require "rails_helper"

RSpec.feature "Admin can change the state of an item" do
  scenario "Admin can click retire next to an item" do
    admin = create_admin

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    create_one_item
    visit admin_dashboard_path

    item = Item.last
    expect(item.state).to eq("active")

    click_on "Items"
    click_on "Retire"

    item = Item.last
    expect(item.state).to eq("retired")
  end

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

    click_link("shopping_cart")
    expect(current_path).to eq(cart_path)

    expect(page).not_to have_content(item.title)
  end

  scenario "admin can reactivate retired item" do
    admin = create_admin

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    create_one_item

    Item.last.retired!
    item = Item.last

    expect(item.state).to eq("retired")

    visit admin_dashboard_path

    click_on "Items"
    click_on "Activate"

    item = Item.last
    expect(item.state).to eq("active")
  end
end
