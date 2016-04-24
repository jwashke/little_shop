require "rails_helper"

RSpec.feature "Admin can change status of an order" do
  scenario "admin can see total orders for each status" do
    admin = create_admin

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_dashboard_path

    create_orders

    click_link("Orders")

    within(".all-tab") do
      expect(page).to have_content("All")
      expect(page).to have_content("1")
    end
    within(".ordered-tab") do
      expect(page).to have_content("Ordered")
      expect(page).to have_content("1")
    end
    within(".paid-tab") do
      expect(page).to have_content("Paid")
      expect(page).to have_content("0")
    end
    within(".completed-tab") do
      expect(page).to have_content("Completed")
      expect(page).to have_content("0")
    end
    within(".cancelled-tab") do
      expect(page).to have_content("Cancelled")
      expect(page).to have_content("0")
    end
  end

  scenario "admin can filter orders by each status" do
    admin = create_admin

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_dashboard_path

    create_orders
    order = Order.last
    click_link("Orders")

    within(".ordered-tab") do
      click_link("Ordered")
    end

    expect(page).to have_content(order.id)
    expect(page).to have_content(order.updated_at)
  end

  scenario "admin can mark an ordered order as paid" do
    admin = create_admin

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_dashboard_path

    create_orders
    click_link("Orders")

    order = Order.last
    expect(order.status).to eq ("ordered")
    within("#all") do
      click_link("Mark as Paid")
    end
    order = Order.last

    expect(order.status).to eq("paid")
  end

  scenario "admin can mark a paid order as completed" do
    admin = create_admin

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    create_orders
    Order.last.paid!
    order = Order.last

    visit admin_dashboard_path
    click_link("Orders")

    expect(order.status).to eq ("paid")

    within("#all") do
      click_link("Mark as Completed")
    end
    order = Order.last

    expect(order.status).to eq("completed")
  end

  scenario "admin can cancel an order that is paid" do
    admin = create_admin

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    create_orders
    Order.last.paid!
    order = Order.last

    visit admin_dashboard_path
    click_link("Orders")

    expect(order.status).to eq ("paid")
    within("#all") do
      click_link "cancel order"
    end

    order = Order.last
    expect(order.status).to eq ("cancelled")
  end

  scenario "admin can cancel an order that is ordered" do
    admin = create_admin

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    create_orders
    Order.last.ordered!
    order = Order.last

    visit admin_dashboard_path
    click_link("Orders")

    expect(order.status).to eq ("ordered")
    within("#all") do
      click_link "cancel order"
    end

    order = Order.last
    expect(order.status).to eq ("cancelled")
  end
end
