require "rails_helper"

RSpec.describe OrderBuilder do
  describe ".create" do
    it "creates orders out of items in the cart" do
      order = create(:order)
      item = create(:item)
      cart = Cart.new(item.id => 1)
      order_builder = OrderBuilder.new(cart, order)
      order_builder.create
      expect(order.items.last).to eq(item)
    end

    it "attaches the order to the current user" do
      order = create(:order)
      user = order.user
      item = create(:item)
      cart = Cart.new(item.id => 1)
      order_builder = OrderBuilder.new(cart, order)
      order_builder.create
      expect(user.items.last).to eq(item)
    end
  end
end
