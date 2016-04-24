require "rails_helper"

RSpec.feature "User can view past order" do
  scenario "They can click and see invoice breakdown" do

    order = create(:invoice).order
    user = User.first
    order = Order.first
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit orders_path

    click_on order.id
    expect(page).to have_content order.items.first.title
    expect(page).to have_content order.items.first.price
    expect(page).to have_content "Status: ordered"
  end
end
