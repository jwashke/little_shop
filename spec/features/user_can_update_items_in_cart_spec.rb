require "rails_helper"

RSpec.feature "User can update quantity of items in cart" do
  scenario 'they stay on the cart page and see updated quantity of items' do
    create_items
    id = Item.last.id
    visit items_path

    within(".card-#{id}") do
      click_button("Add to Cart")
    end

    visit cart_path

    within("ul.collection:nth-child(1)") do
      expect(page).to have_content("Item 2")
      expect(page).to have_field("quantity", with: "1")
      expect(page).to have_content("5.99")
    end
    expect(page).to have_content("Total: 5.99")

    fill_in("quantity", with: "3")
    click_button("Update")

    expect(current_path).to eq(cart_path)

    within("ul.collection:nth-child(1)") do
      expect(page).to have_content("Item 2")
      expect(page).to have_field("quantity", with: "3")
      expect(page).to have_content("17.97")
    end
    expect(page).to have_content("Total: 17.97")

    fill_in("quantity", with: "2")
    click_button("Update")

    expect(current_path).to eq(cart_path)

    within("ul.collection:nth-child(1)") do
      expect(page).to have_content("Item 2")
      expect(page).to have_field("quantity", with: "2")
      expect(page).to have_content("11.98")
    end
    expect(page).to have_content("Total: 11.98")
  end
end
