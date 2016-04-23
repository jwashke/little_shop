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

# Background: An existing user that has one previous order
#       As an authenticated user
#       When I visit "/orders"
#       Then I should see my past order
#       And I should see a link to view that order
#       And when I click that link
#       Then I should see each item that was order with the quantity and line-item subtotals
#       And I should see links to each item's show page
#       And I should see the current status of the order (ordered, paid, cancelled, completed)
#       And I should see the total price for the order
#       And I should see the date/time that the order was submitted
#       If the order was completed or cancelled
#       Then I should see a timestamp when the action took place
