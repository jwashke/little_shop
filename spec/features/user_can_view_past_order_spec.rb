require "rails_helper"

RSpec.feature "User can view past order" do
  scenario "They can click and see invoice breakdown" do
    user = create_user

    create_orders

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit orders_path
    click_on "04/21/2016"
    expect(page).to have_content "Item 1"
    expect(page).to have_content "Item 2"
    expect(page).to have_content "15.98"
    expect(page).to have_content "Status: Ordered"
  end
end
