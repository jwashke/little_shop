require "rails_helper"

RSpec.describe Invoice, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:item) }
    it { is_expected.to belong_to(:order) }
  end

  describe ".total" do
    it "returns the total of its item price and quantity" do
      invoice = create(:invoice)
      expect(invoice.total).to eq(9.99)
    end
  end
end
