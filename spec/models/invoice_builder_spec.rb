require "rails_helper"

RSpec.describe InvoiceBuilder do
  describe ".create" do
    it "creates invoices out of items in the cart" do
      order = create(:order)
      user = create(:user)
      item = create(:item)
      cart = Cart.new({ item.id => 1 })
      invoice_builder = InvoiceBuilder.new(cart, user, order)
      invoice_builder.create
      expect(Invoice.last.item).to eq(item)
    end

    it "attaches the order to the current user" do
      order = create(:order)
      user = create(:user)
      item = create(:item)
      cart = Cart.new({ item.id => 1 })
      invoice_builder = InvoiceBuilder.new(cart, user, order)
      invoice_builder.create
      expect(user.items.last).to eq(item)
    end
  end
end
