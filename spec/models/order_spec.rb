require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to have_many(:invoices) }
  it { is_expected.to have_many(:items) }

  describe ".ordered" do
    it "includes orders with status ordered" do
      ordered_order = create(:order)
      expect(Order.ordered).to include(ordered_order)
    end

    it "excludes orders without status ordered" do
      paid_order = create(:paid_order)
      expect(Order.ordered).not_to include(paid_order)
    end
  end

  describe ".paid" do
    it "includes orders with status paid" do
      paid_order = create(:paid_order)
      expect(Order.paid).to include(paid_order)
    end

    it "excludes orders without status paid" do
      ordered_order = create(:order)
      expect(Order.paid).not_to include(ordered_order)
    end
  end

  describe ".completed" do
    it "includes orders with status completed" do
      completed_order = create(:completed_order)
      expect(Order.completed).to include(completed_order)
    end

    it "excludes orders without status completed" do
      ordered_order = create(:order)
      expect(Order.completed).not_to include(ordered_order)
    end
  end

  describe ".cancelled" do
    it "includes orders with status cancelled" do
      cancelled_order = create(:cancelled_order)
      expect(Order.cancelled).to include(cancelled_order)
    end

    it "excludes orders without status cancelled" do
      ordered_order = create(:order)
      expect(Order.cancelled).not_to include(ordered_order)
    end
  end

  describe ".quantity" do
    it "returns the total quantity of items in the order" do
      order = create(:order)
      order.invoices.create(quantity: 1)
      order.invoices.create(quantity: 2)
      expect(order.quantity).to eq(3)
    end
  end

  describe ".total" do
    it "returns the total dollar amount of the order" do
      order = create(:order)
      order.invoices = create_list(:invoice, 2)
      expect(order.total).to eq(19.98)
    end
  end

  describe ".cycle_status" do
    it "changes an ordered status to paid" do
      order = create(:order)
      order.cycle_status
      expect(order.status).to eq("paid")
    end

    it "changes a paid status to completed" do
      order = create(:paid_order)
      order.cycle_status
      expect(order.status).to eq("completed")
    end

    it "doesn't change a completed status" do
      order = create(:completed_order)
      order.cycle_status
      expect(order.status).to eq("completed")
    end

    it "doesn't change a cancelled status" do
      order = create(:cancelled_order)
      order.cycle_status
      expect(order.status).to eq("cancelled")
    end
  end
end
