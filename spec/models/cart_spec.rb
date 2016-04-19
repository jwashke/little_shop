require "rails_helper"

RSpec.describe "Cart" do
  it "has initial contents" do
    cart = Cart.new({ "1" => 1 })

    expect(cart.contents).to eq({ "1" => 1 })
  end

  it "can add an item" do
    cart = Cart.new({ "1" => 1 })

    cart.add_item(1)
    cart.add_item(2)
    cart.add_item(1)

    assert_equal({ "1" => 3, "2" => 1 }, cart.contents)
  end
end
