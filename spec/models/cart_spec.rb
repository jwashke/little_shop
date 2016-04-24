require "rails_helper"

RSpec.describe "Cart" do
  it "has initial contents" do
    cart = Cart.new("1" => 1)

    expect(cart.contents).to eq("1" => 1)
  end

  describe ".add_item" do
    it "can add an item" do
      cart = Cart.new(nil)
      cart.add_item(1)
      expect(cart.contents).to eq("1" => 1)
    end
  end

  describe ".total" do
    it "returns the total price of all items" do
      item = create(:item)
      cart = Cart.new(item.id => 1)
      expect(cart.total).to eq(9.99)
    end
  end

  describe ".all_items" do
    it "returns an array of cart items for each item" do
      item = create(:item)
      cart = Cart.new(item.id => 1)
      expect(cart.all_items.first.class).to eq(CartItems)
    end
  end

  describe ".delete_item" do
    it "deletes an item from the cart" do
      item = create(:item)
      cart = Cart.new(item.id.to_s => 1)
      cart.delete_item(item.id)
      expect(cart.contents).to eq({})
    end
  end

  describe ".updated_item" do
    it "updated the quantity of an item in the cart" do
      item = create(:item)
      cart = Cart.new(item.id.to_s => 1)
      cart.update_item(item.id, 2)
      expect(cart.contents).to eq(item.id.to_s => 2)
    end
  end
end
